//
//  ViewController.swift
//  TableViewSample
//
//  Created by 손성빈 on 2017. 7. 24..
//  Copyright © 2017년 seongbinson. All rights reserved.
//

import UIKit

@IBDesignable class ViewController: UITableViewController {

    let imageName = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let imageWidth = [1920, 1920, 1920, 1920, 1920, 1920, 1920, 1280]
    let imageHeight = [960, 1220, 1280, 1334, 1280, 1280, 1032, 720]
    
    // default cell gap height
    @IBInspectable var cellGapHeight: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //remove cell bottom border
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "first", for: indexPath) as! FirstTableViewCell
        
        let ratio = CGFloat(imageWidth[indexPath.row]) / tableView.frame.width
        
        cell.photoView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: CGFloat(imageHeight[indexPath.row]) / ratio)
        cell.photoView.image = UIImage(named: imageName[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let ratio = CGFloat(imageWidth[indexPath.row]) / tableView.frame.width
        
        return (CGFloat(imageHeight[indexPath.row]) / ratio) + cellGapHeight
    }
    
    
    
}

