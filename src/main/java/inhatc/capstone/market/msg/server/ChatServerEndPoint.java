package inhatc.capstone.market.msg.server;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import inhatc.capstone.market.msg.server.config.ChatServerAppConfig;
import inhatc.capstone.market.msg.server.model.ChatMessageVO;
import inhatc.capstone.market.msg.server.model.Message;
import inhatc.capstone.market.msg.server.model.UsersMessageVO;
import inhatc.capstone.market.msg.server.model.decoder.MessageDecoder;
import inhatc.capstone.market.msg.server.model.encoder.MessageEncoder;
import inhatc.capstone.market.user.UserVO;

@ServerEndpoint(value = "/chat/{room}", encoders={MessageEncoder.class}, decoders={MessageDecoder.class}, configurator=ChatServerAppConfig.class)
public class ChatServerEndPoint {
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatServerEndPoint.class);
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());

	/**
	 * Handshaking 함수
	 * @param userSession 사용자 session
	 */
	@OnOpen
	public void handleOpen(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		userSession.getUserProperties().put("room", room);
		
		chatroomUsers.add(userSession);
		//System.out.println("chatroom 갯수: "+chatroomUsers.size());
	}

	/**
	 * 메시지 전달 함수
	 * @param incomingMessage 들어오는 메시지
	 * @param userSession 사용자 session
	 * @param room room Id
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		
		ChatMessageVO incomingChatMessage = (ChatMessageVO)incomingMessage;
		ChatMessageVO outgoingChatMessage = new ChatMessageVO();

		String username = (String) userSession.getUserProperties().get("username");
		
		System.out.println("방 ID : ["+ room +"]에서 유저["+username+"]가 메시지를 보냇습니다.");
		if (username == null) {

			username = incomingChatMessage.getMessage();
			if (username != null) {
				userSession.getUserProperties().put("username", username);
			}

			synchronized (chatroomUsers) {
				for (Session session : chatroomUsers){
					session.getBasicRemote().sendObject(new UsersMessageVO(getUsers()));
				}
			}
		} else {
			outgoingChatMessage.setName(username);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());

			for (Session session : chatroomUsers){
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
	}


	//누군가가 접속 끊을때
	@OnClose
	public void handleClose(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException{
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers){
			session.getBasicRemote().sendObject(new UsersMessageVO(getUsers()));
		}
	}

	/**
	 * 사용자가 접속 끊기 전 호출되는 함수
	 * @param session
	 * @param throwable
	 * @param room
	 */
	@OnError
    public void handleError(Session session, Throwable throwable, @PathParam("room") final String room) {
        // Error handling
		LOGGER.info("ChatServerEndPoint (room: "+room+") occured Exception!");
		LOGGER.info("Exception : "+throwable.getMessage());
    }

	/**
	 * 사용자 정보를 가져오는 함수
	 * @return
	 */
	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers){
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}
}
