package inhatc.capstone.market.msg.server.model.decoder;

import java.io.StringReader;

import inhatc.capstone.market.msg.server.model.ChatMessageVO;
import inhatc.capstone.market.msg.server.model.Message;

import javax.json.Json;
import javax.json.JsonException;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class MessageDecoder implements Decoder.Text<Message> {
	@Override
	public void destroy() {}

	@Override
	public void init(EndpointConfig arg0) {}

	/**
	 * 화면에서 넘어오는 데이터를 decoding하는 함수
	 */
	@Override
	public Message decode(String message) throws DecodeException {
		ChatMessageVO chatMessage = new ChatMessageVO();

		JsonObject jsonObject = Json
				.createReader(new StringReader(message)).readObject();
		chatMessage.setMessage(jsonObject.getString("message"));
		chatMessage.setRoom(jsonObject.getString("room"));
		return chatMessage;
	}

	@Override
	public boolean willDecode(String message) {
		boolean flag = true;

		try {
			Json.createReader(new StringReader(message)).readObject();
		} catch (JsonException ex) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			flag = false;
		} catch (Exception ex) {
			flag = false;
		}
		return flag;
	}
}
