//
//  SecondViewController.swift
//  Kanto
//
//  Created by Mbongeni NDLOVU on 2018/10/08.
//  Copyright © 2018 mndlovu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PinCoordinates.point.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.cellView.layer.cornerRadius = 10
        cell.name.text = PinCoordinates.point[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PinCoordinates.isSelected = true
        PinCoordinates.selected = indexPath.row
        self.tabBarController?.selectedIndex = 0
    }

}

