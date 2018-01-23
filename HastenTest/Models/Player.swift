//
//  Player.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import Foundation

struct Player : Codable {
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case name = "name"
        case surname = "surname"
    }
    
    let image : String?
    let name : String?
    let surname : String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        surname = try values.decodeIfPresent(String.self, forKey: .surname)
    }
}
