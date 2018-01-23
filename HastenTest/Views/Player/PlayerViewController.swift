//
//  PlayerViewController.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var player : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
    }
}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.player.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        cell.lblName.text = self.player[indexPath.row].name
        cell.lblSurname.text = self.player[indexPath.row].surname
        cell.lblDate.text = self.player[indexPath.row].date
        
        return cell
    }
}
