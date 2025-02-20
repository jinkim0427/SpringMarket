package inhatc.capstone.market.msg.server.config;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

import inhatc.capstone.market.msg.server.ChatServerEndPoint;

public class ChatServerAppConfig extends Configurator{
	//대화창 서버객체(ChatServerEndPoint) 저장하는 Map
	private final static Map<String, ChatServerEndPoint> endpointMap = new HashMap<String, ChatServerEndPoint>();
	private String currentUri;

	@SuppressWarnings("unchecked")
	@Override
     public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException {

		 ChatServerEndPoint endpoint = endpointMap.get(currentUri);

		 if(endpoint == null) {
			 endpoint = new ChatServerEndPoint();
			 endpointMap.put(currentUri, endpoint);
		 }

		 return (T)endpoint;
     }

	@Override
	public void modifyHandshake(ServerEndpointConfig sec,
			HandshakeRequest request, HandshakeResponse response) {
		currentUri = request.getRequestURI().toString();
		super.modifyHandshake(sec, request, response);
	}
}
