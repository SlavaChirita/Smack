//
//  File.swift
//  Smack
//
//  Created by Slava Chirita on 2/12/19.
//  Copyright © 2019 Slava Chirita. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int!
}
