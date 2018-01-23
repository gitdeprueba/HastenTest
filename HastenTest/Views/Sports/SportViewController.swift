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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Sports"
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SportCell")
        self.getSports()
    }
    
    
    private func getSports() {
        WebServiceLayer.retrieveSports({ (response) in
            
            guard let sportsArray = response else {
                return
            }
            self.sports = sportsArray
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            self.tableView.reloadData()
        })
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
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sport = self.sports[indexPath.row]
        let playerVC = PlayerViewController()
        playerVC.players = sport.players
        playerVC.title = sport.title
        self.navigationController?.pushViewController(playerVC, animated: true)
    }

}
