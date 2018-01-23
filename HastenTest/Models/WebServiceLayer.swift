//
//  WebServiceLayer.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import Foundation
import Alamofire

class WebServiceLayer: NSObject {
    
    class func retrieveSports(_ completion:@escaping ([Sports]?)->() ) {
        
        Alamofire.request("https://api.myjson.com/bins/66851").responseData { (data) in
            if let sportData = data.data {
                let sports = try! JSONDecoder().decode([Sports].self, from: sportData) as [Sports]
                completion(sports)
            }else{
                print("Error")
                completion(nil)
            }
        }
        
    }
    
}
