package inhatc.capstone.market.msg.server.config;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import inhatc.capstone.market.msg.server.ChatServerEndPoint;
import inhatc.capstone.market.msg.server.UsersServerEndPoint;

public class ServerAppConfig extends Configurator{
	
	@Override
    public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException {
			
            WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
            if (wac == null) {
                    throw new IllegalStateException("Failed to find WebApplicationContext. "
                                    + "Was org.springframework.web.context.ContextLoader used to load the WebApplicationContext?");
            }

            Map<String, T> beans = wac.getBeansOfType(endpointClass);
            if (beans.isEmpty()) {
                    // Initialize a new bean instance
                    return wac.getAutowireCapableBeanFactory().createBean(endpointClass);
            }
            if (beans.size() == 1) {
                    // Return the matching bean instance
                    return beans.values().iterator().next();
            }
            else {
                    // This should never happen (@ServerEndpoint has a single path mapping) ..
                    throw new IllegalStateException("Found more than one matching beans of type " + endpointClass);
            }
            
		

    }
	
	
	
}
