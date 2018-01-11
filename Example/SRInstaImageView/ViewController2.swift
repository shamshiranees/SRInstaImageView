//
//  ViewController2.swift
//  instagramView
//
//  Created by Shamshir on 11/01/18.
//  Copyright © 2018 shamshir. All rights reserved.
//

import UIKit
import SRInstaImageView

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! TableViewCell
        if indexPath.row > 8{
            cell.photoImageView.image = UIImage(named: "\(indexPath.row-8)")
            cell.photoImageView.iconImage = UIImage(named: "\(indexPath.row-8)")!
        }else{
            cell.photoImageView.image = UIImage(named: "\(indexPath.row+1)")
            cell.photoImageView.iconImage = UIImage(named: "\(indexPath.row+1)")!
        }
        
        cell.photoImageView.mainTitle = "Title \(indexPath.row+1)"
        cell.photoImageView.subTitle = "Subtitle \(indexPath.row+1)"
        cell.photoLabel.text = "SRInstaImageView \(indexPath.row+1)"
        cell.photoImageView.tableView = tableView
        cell.photoImageView.indexPathOFCell = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
