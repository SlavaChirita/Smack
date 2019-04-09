//
//  MessageService.swift
//  Smack
//
//  Created by Slava Chirita on 2/18/19.
//  Copyright © 2019 Slava Chirita. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel : Channel?
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseString { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }

                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
                print(self.channels)
                
                //                if let json = JSON(data: data).array {
//                    for item in json {
//                        let name = item["name"].stringValue
//                        let channelDescription = item["description"].stringValue
//                        let id = item["_id"].stringValue
//                        let channel = Channel(id: id, channelTitle: name, description: channelDescription)
//                        self.channels.append(channel)
//                    }
//                    completion(true)
//                }
                
                NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                completion(true)
                
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseString { (response) in
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                var test = JSON(data: data)
                print(response.data)
                if let json = JSON(data: data).array {
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        let id = item["_id"].stringValue
                        let channelId = item["channelId"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                    
                        let newMessage = Message(message: messageBody, userName: userName, userAvatar: userAvatar, userAvatarColor: userAvatarColor, channelId: channelId, id: id, timeStamp: timeStamp)
                        
                        self.messages.append(newMessage)
                        
                    }
                    print(self.messages)
                    completion(true)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    func clearMessages() {
        messages.removeAll()
    }
    
}
