//
//  PlayerViewController.swift
//  HastenTest
//
//  Created by 67363374 on 23/1/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit
import SDWebImage

class PlayerViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var players : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 110
        
        self.tableView.register(UINib.init(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
    }
}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let player = self.players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        cell.lblName.text = player.name
        cell.lblSurname.text = player.surname
        cell.lblDate.text = player.date
        
        let urlImage = URL(string: player.image)
        cell.img.sd_setImage(with: urlImage , placeholderImage: #imageLiteral(resourceName: "placeholder"), options: [], completed: nil)
        
        return cell
    }
}
