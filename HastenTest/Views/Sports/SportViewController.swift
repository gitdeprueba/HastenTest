//
//  StartViewController.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class SportViewController: UIViewController {

    var sports : [Sports] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SportCell")
        //let sport = try! JSONDecoder().decode([Sports].self, from: fileData)
        
    }

}
extension SportViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportCell", for: indexPath)
        
        let sportTitle = self.sports[indexPath.row].title
        cell.textLabel?.text = sportTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("hola")
    }

}
