//
//  StartViewController.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let file = Bundle.main.path(forResource: "players", ofType: "json")
        let fileData = try! Data(contentsOf: URL(fileURLWithPath: file!), options: .mappedIfSafe)
        
        let sport = try! JSONDecoder().decode([Sports].self, from: fileData)
        
        print(sport[0].title!)
        print(sport[0].type!)
        print(sport[0].players![0].name!)
        print(sport[0].players![0].surname!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
 let url = URL(string: image.url)
 
 DispatchQueue.global().async {
 let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
 DispatchQueue.main.async {
 imageView.image = UIImage(data: data!)
 }
 }
 */

}
