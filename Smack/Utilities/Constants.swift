//
//  Constants.swift
//  Smack
//
//  Created by Slava Chirita on 2/10/19.
//  Copyright © 2019 Slava Chirita. All rights reserved.
//

import Foundation

let TO_LOGIN = "toLogin"
let TO_CREATE_ACC = "toCreateAcc"
let UNWIND = "unwindToChannel"
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEMail"
let TO_AVATAR_PICKER = "toAvatarPicker"

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL
let BASE_URL = "https://chattychat1989.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_GET_CHANNELS = "\(BASE_URL)channel"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel"


//headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type":"application/json; charset=utf-8"
]

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNELS_SELECTED = Notification.Name("channelsSelected")

//COlors
let smackPurplePlaceholder = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)
