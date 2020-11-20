package inhatc.capstone.market.msg.server;

import java.io.IOException;
import java.io.StringReader;
import java.util.Collections;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import inhatc.capstone.market.msg.server.config.ServerAppConfig;

@ServerEndpoint(value = "/usersServerEndpoint/{channel}"/* , configurator=ServerAppConfig.class*/)
public class UsersServerEndPoint {
	private static final Logger LOGGER = LoggerFactory.getLogger(UsersServerEndPoint.class);

	private static Set<Session> connectedAllUsers = Collections.synchronizedSet(new HashSet<Session>());
	//일종의 유저들을 모두 모아두는 방이라고 보면 될 것 같다. 
	
	//Spring bean과 연동하기 위해서는 ServerAppConfig를 configurator로 등록해주면 된다.
	/*
	 * @Resource(name="TestService") TestService testService;
	 */
	/**
	 * Handshaking 함수
	 * @param userSession 사용자 session
	 */
	
	@OnOpen
	public void handleOpen(Session userSession,@PathParam("channel") final String channel) {
		//OnOpen 이 실행되면 현재 유저의 세션을 가지고와서 connectedAllUsers에 넣어주게된다.
		userSession.getUserProperties().put("channel", channel);
		String cn = userSession.getUserProperties().get("channel").toString();
		System.out.println("접속한 채널명 : "+cn);
		connectedAllUsers.add(userSession);
		System.out.println("현재 서버에 접속중인 유저수 : " + connectedAllUsers.size());
		
	}


	/**
	 * Message전달 함수
	 * @param message 메시지
	 * @param userSession 사용자 session
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnMessage
	public void handleMessage(String message, Session userSession,@PathParam("channel") final String channel) throws IOException, EncodeException {
		//webSocket.send(JSON.stringify({ "connectionType" : connectionType, "username" : username }));
		//를 통해 넘어온 값 을 각각 message 와 userSession으로 받은 것이고
		
		String username = (String) userSession.getUserProperties().get("username");
		//여기서는 username 키를 이용해 세션으로 받은 값의 value를 찾아 String으로 형변환해서 username을 찾아낸것이고.
		
		JsonObject jsonObject = Json.createReader(new StringReader(message)).readObject();
		// Json으로 보낸 값이기 때문에 message를 Json형식으로 변환시키고
		// 필요한 값을 꺼내기 위해 키 값을 이용한다.
		
		String connectionType = jsonObject.getString("connectionType"); //키 값 connectionType이용

		if ("firstConnection".equals(connectionType) && username == null) {
			// 맨 처음 접속 시,
			// 사용자의 이름을 가져옴
			username = jsonObject.getString("username");

			LOGGER.info(username + "님이 접속하였습니다."); //접속햇음을 알림
			
			// isExisted는 중복확인하는 거고 중복이라면 true 없다면 false
			// !isExisted 로 썻기때문에 중복이 있다면 false 로 실행시키지 않는다는 뜻
			// 여기서 username은 사용자의 ID값으로 사용하기 때문에 중복이 일어날일이 없고
			// 그렇다는 뜻은 이 if문이 true 가됨
			
			//즉 여기서 새로 만들어지는 과정이라고 햇을때 
			// username을 넣어주고 넣어진 유저들의 값들을 각 서버들에게 전달
			if (username != null && !isExisted(username)) {
				
				userSession.getUserProperties().put("username", username);
				
				//현재 연결된 세션들에게 getBasicRemote 를 통해 뿌려주게됨 JSON형식으로 getUsers 함수의 리턴값을
				// 여기서 이제 내가 원하는 세션의 값이 있는지만 확인할 수 있는 함수를 만들어야함
				/*
				for (Session session : connectedAllUsers) {
					session.getBasicRemote().sendText(buildJsonUserData(getUsers()));
				}
				*/
				
				for (Session session : connectedAllUsers) {
					if(session.getUserProperties().get("channel").equals(channel)) {
						session.getBasicRemote().sendText(buildJsonUserData(getUsers(channel)));
					}
				}
			} else {
				
			}

		} else if ("chatConnection".equals(connectionType)) {
			// chatroomId로 또다른 webSocket url에 접근한다.
			// id generation으로 대체가능.
			String chatroomId = genRandom();

			// 다른 사용자와 대화하고자 시도할 때
			// 채팅룸 사용자 저장
			Set<Session> chatroomMembers = new HashSet<Session>();
			chatroomMembers.add(userSession); //일단 요청하는 유저는 먼저 방에 들어가게끔 한다.
			// <<<이전 이나 이후로 커넥트를 요청하는 메시지를 연결을 원하는 유저에게 메시지를 요청하는 팝업을 띄울수있도록 할수 있을것같다.>>>

			// 선택한 사용자를 사용자들 안에서 찾기.
			// 이부분을 변경해서 해당 판매자의 이름이 있는지 확인할 수 있도록 변경해야함
			// 단 예제에서는 소켓을 갖고있는 유저들중에 선택한거라 String에 null 값이 올일이 없지만
			// 만약에 판매자의 이름으로 찾게된다면 null 값이 생길 문제점이 발생함
			String connectingUser = jsonObject.getString("connectingUser");

			if (connectingUser != null && !username.equals(connectingUser)) {
				// 사용자들 중 선택한 유저와 연결
				//connectedAllUsers 이부분이 문제임 만약에 엄청나게 많은 유저가 생기면 다 돌아야하는 문제 생김
				
				for (Session session : connectedAllUsers) {
					if (connectingUser.equals(session.getUserProperties().get("username"))) {
						// 현재 선택한 사용자가 로그인 상태이면 
						// chatroomMember로 추가.
						chatroomMembers.add(session); //상대방의 세션을 추가함
					}
				}

				// chatroomMembers에게 room입장하라는 신호 보내기
				// chatroomMembers 안에는 이제 2명의 세션이 들어가 있게 되고.
				for (Session session : chatroomMembers) {

					session.getBasicRemote().sendText(
							Json.createObjectBuilder().add("enterChatId", chatroomId).add("username", (String) session.getUserProperties().get("username")).build().toString());
					//각각의 클라이언트들에게 enterChatId가 있는 명령을 하게끔 한다.
					// 여기서 chatRoomID로 들어가게끔한다. user name은 각각의 session으로 넣어줌으로써 자기 아이디로 들어가게된다.
				}
			}
		}
	}

	/**
	 * 연결을 끊기 직전에 호출되는 함수
	 * @param userSession
	 * @throws IOException
	 * @throws EncodeException
	 */
	// 예외처리 필요!
	@OnClose
	public void handleClose(Session userSession) throws IOException, EncodeException {

		String disconnectedUser = (String) userSession.getUserProperties().get("username");
		connectedAllUsers.remove(userSession);

		if (disconnectedUser != null) {
			Json.createObjectBuilder().add("disconnectedUser", disconnectedUser).build().toString();
			
			//유저가 나감으로써 해당 소켓이 사라지면 다른 클라이언트들에게 알리기 위함
			for (Session session : connectedAllUsers) {
				session.getBasicRemote().sendText(Json.createObjectBuilder().add("disconnectedUser", disconnectedUser).build().toString());
			}
		}
	}

	/**
	 * 연결되어있는 user정보를 가져오는 함수
	 * @return user set
	 */
	// [미사용]
	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : connectedAllUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			};
		}
		return returnSet;
	}
	
	//2번째 getUsers
	private Set<String> getUsers(String channel){
		HashSet<String> returnSet = new HashSet<String>();
		
		for(Session session : connectedAllUsers) {
			if(session.getUserProperties().get("channel").equals(channel)) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}
	/**
	 * 유저 정보가 담긴 Set<String>을 json으로 변환해주는 함수
	 * @param set
	 * @return jsondata
	 */
	private String buildJsonUserData(Set<String> set) {

		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();

		for (String user : set) {
			jsonArrayBuilder.add(user);
		}
		return Json.createObjectBuilder().add("allUsers", jsonArrayBuilder).build().toString();
	}

	/**
	 * 동일한 username을 가진 user session이 있는지 확인하는 함수
	 * @param username 사용자이름
	 * @return 존재여부
	 */
	private boolean isExisted(String username) {
		// 이미 username을 가진 session이 있는지 검사.
		for (Session existedUser : connectedAllUsers) {
			if (username.equals(existedUser.getUserProperties().get("username"))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * chatroomId를 위한 랜덤값을 생성하는 함수
	 * @return chatroomId
	 */
	private String genRandom() {
		String chatroomId = "";
		for (int i = 0; i < 8; i++) {
			chatroomId += (char) ((new Random().nextDouble() * 26) + 97);
		}
		return chatroomId;
	}
}
