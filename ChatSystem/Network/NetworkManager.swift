//
//  NetworkManager.swift
//  chadodo
//
//  Created by Alexander Saberdine on 22/05/2016.
//  Copyright © 2016 unknown. All rights reserved.
//

import Foundation
//import Starscream
import SwiftWebSocket

class NetworkManager { //WebSocketDelegate
    

    func echoTest(){
        var messageNum = 0
        let ws = WebSocket("wss://codingtest.meedoc.com/ws")
        let send : ()->() = {
            let msg = "\(++messageNum): \(NSDate().description)"
            print("send: \(msg)")
            ws.send(msg)
        }
        ws.event.open = {
            print("opened")
            //send()
        }
        ws.event.close = { code, reason, clean in
            print("close")
        }
        ws.event.error = { error in
            print("error \(error)")
        }
        ws.event.message = { message in
            if let text = message as? String {
                print("recv: \(text)")
                if messageNum == 10 {
                    ws.close()
                } else {
                    send()
                }
            }
        }
    }
    
    func openSocket() {
        
        
        
//        print("openSocket fired!")
//
//        let socket = WebSocket(url: NSURL(string: "wss://codingtest.meedoc.com:80/ws")!)
//        //"ws://localhost:9998/echo"
//        socket.headers["username"] = "meedoc"
//        socket.delegate = self
////        socket.selfSignedSSL = true
//        socket.connect()
//        print(socket.isConnected)
    }

//    func websocketDidConnect(socket: WebSocket) {
//        print("websocket is connected")
//    }
//    
//    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
//        print("websocket is disconnected: \(error?.localizedDescription)")
//    }
//    
//    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
//        print("got some text: \(text)")
//    }
//    
//    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
//        print("got some data: \(data.length)")
//    }
    
}