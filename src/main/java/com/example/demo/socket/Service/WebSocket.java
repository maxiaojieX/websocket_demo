package com.example.demo.socket.Service;

import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import java.net.InetSocketAddress;
import java.net.UnknownHostException;

/**
 * Created by Administrator on 2017/11/18 0018.
 */
public class WebSocket extends WebSocketServer{

    public WebSocket(InetSocketAddress address) {
        super(address);
        System.out.println("地址"+address);
    }

    public WebSocket(int port) throws UnknownHostException {
        super(new InetSocketAddress(port));
        System.out.println("端口"+port);
    }
    /**
     * 触发关闭事件
     */
    @Override
    public void onClose(org.java_websocket.WebSocket conn, int message,
                        String reason, boolean remote) {
        serviceBesiness.userLeave(conn);
    }
    /**
     * 触发异常事件
     */
    @Override
    public void onError(org.java_websocket.WebSocket conn, Exception message) {
        System.out.println("Socket异常:"+message.toString());
        message.printStackTrace();
        e++;
    }
    /**
     * 客户端发送消息到服务器时触发事件
     */
    int j=0;
    int h=0;
    int e=0;
    int l=0;

    static ServiceBesiness serviceBesiness = new ServiceBesiness();

    @Override
    public void onMessage(org.java_websocket.WebSocket conn, String message) {
        message = message.toString();
        if(message!=null){
            //将数据交给 handlerMessage处理
            serviceBesiness.handlerMessage(message);
        }
    }
    /**
     * 触发连接事件
     */
    @Override
    public void onOpen(org.java_websocket.WebSocket conn, ClientHandshake handshake) {
        serviceBesiness.websocketAddHandler(conn);
        System.out.println("有人连接Socket conn:"+conn);
        l++;
    }
    /**
     * 用户加入处理
     * @param user
     */
    //public void userjoin(String user, org.java_websocket.WebSocket conn) {
//        WebSocketPool.sendMessage(user); // 把当前用户加入到所有在线用户列表中
//        String joinMsg = "[系统]"+user+"上线了！";
//        WebSocketPool.sendMessage(joinMsg); // 向所有在线用户推送当前用户上线的消息
//
//        WebSocketPool.addUser(user, conn); // 向连接池添加当前的连接对象
//        WebSocketPool.sendMessageToUser(conn, WebSocketPool.getOnlineUser().toString()); // 向当前连接发送当前在线用户的列表
    //}
    /**
     * 用户下线处理
     * @param user
     */
//    public void userLeave(org.java_websocket.WebSocket conn) {
//        String user = WebSocketPool.getUserByKey(conn);
//        boolean b = WebSocketPool.removeUser(conn); // 在连接池中移除连接
//        if (b) {
//            WebSocketPool.sendMessage(user.toString()); // 把当前用户从所有在线用户列表中删除
//            String joinMsg = "[系统]"+user+"下线了";
//            WebSocketPool.sendMessage(joinMsg); // 向在线用户发送当前用户退出的消息
//        }
//    }


}
