//
//  NetworkManager.swift
//  chadodo
//
//  Created by Alexander Saberdine on 22/05/2016.
//  Copyright © 2016 unknown. All rights reserved.
//

import Foundation

class NetworkManager {
    


    func openSocket(userName: String = "Unknown") {
        
        let request = NSMutableURLRequest(URL: NSURL(string:"wss://codingtest.meedoc.com/ws?username=\(userName)")!)
        var messageNum = 0

        let ws = WebSocket(request: request)
        
        
        let send : ()->() = {
            let msg = "\( messageNum += 1): \(NSDate().description)"
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
    
}