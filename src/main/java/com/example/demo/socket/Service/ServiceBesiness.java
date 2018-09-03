package com.example.demo.socket.Service;

import org.java_websocket.WebSocket;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/**
 * Created by Administrator on 2017/11/19 0019.
 */
@Controller
public class ServiceBesiness {
    /**
     * 用来存放连接
     */
    private static final Map<WebSocket, String> webSocketMap = new HashMap<WebSocket, String>();

    /***
     * 处理用户传来的消息
     */
    public void handlerMessage(String message) {
        messagePush(message);
    }

    /**
     * 处理新增的websocket
     * @param webSocket
     */
    public void websocketAddHandler(WebSocket webSocket) {
        Set<WebSocket> webSocketSet = webSocketMap.keySet();
        synchronized (webSocketSet){
            boolean FLAG = false;
            String accountId = UUID.randomUUID().toString();
            for(WebSocket w : webSocketSet) {
                if(w == webSocket){
                    FLAG = true;
                }
            }
            if(!FLAG){
                websocketAdd(webSocket,accountId);
            }
        }
    }

    /**
     * 用户下线处理
     * @param webSocket
     */
    public void userLeave(WebSocket webSocket) {
        webSocketMap.remove(webSocket);
    }


    /**
     * 把新来的用户和连接存进WebSocket的Map集合
     * @param webSocket
     * @param accountId
     */
    public static void websocketAdd(WebSocket webSocket,String accountId) {
        webSocketMap.put(webSocket,accountId);
    }


    /**
     * 消息推送-至所有人
     * @param message
     */
    public static void  messagePush(String message) {
        Set<WebSocket> webSocketSet = webSocketMap.keySet();
        //加安全锁,
        synchronized (webSocketSet){
            for(WebSocket webSocket : webSocketSet) {
                String accountId = webSocketMap.get(webSocket);
                if(accountId != null) {
                    webSocket.send(message);
                }
            }
        }

    }

}
