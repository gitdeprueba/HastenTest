//
//  Players.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import Foundation

struct Sports : Codable {
    
    enum CodingKeys: String, CodingKey {
        case players = "players"
        case title = "title"
        case type = "type"
    }
    
    let players : [Player]!
    let title : String!
    let type : String!
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        players = try values.decodeIfPresent([Player].self, forKey: .players)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
    
}
