//
//  NetworkManager.swift
//  chadodo
//
//  Created by Alexander Saberdine on 22/05/2016.
//  Copyright © 2016 unknown. All rights reserved.
//

import Foundation

class NetworkManager {
    
    
    let ws = WebSocket()
    
    func sendMessage(message:String = "Message is Empty") {
        let msg = "\(message)"
        self.ws.send(msg)
        print("sent: \(msg)")
    }
    
    func closeSocket() {
        ws.event.close = { code, reason, clean in
        }
    }
    func openSocket(userName: String = "Unknown") {
        
        let request = NSMutableURLRequest(URL: NSURL(string:"wss://codingtest.meedoc.com/ws?username=\(userName)")!)
        
        ws.open(request: request)
        ws.event.error = { error in
            fatalError("error: \(error)")
        }
        ws.event.message = { message in
            if let text = message as? String {
                print("recv: \(text)")
            }
        }
    }
}