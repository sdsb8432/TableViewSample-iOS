//
//  ViewController.swift
//  TableViewSample
//
//  Created by 손성빈 on 2017. 7. 24..
//  Copyright © 2017년 seongbinson. All rights reserved.
//

import UIKit

@IBDesignable class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SegmentDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var imageName = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let imageWidth = [1920, 1920, 1920, 1920, 1920, 1920, 1920, 1280]
    let imageHeight = [960, 1220, 1280, 1334, 1280, 1280, 1032, 720]
    
    var contentArray = ["asdfasdf", "asdfasdfa"]
    
    // default cell gap height
    @IBInspectable var cellGapHeight: CGFloat = 10
    
    var secondCell: SecondTableViewCell!
    
    var indexRows: [IndexPath]! = []
    
    var segmentMode: Int = 0
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //remove cell bottom border
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        
        //tableView.deleteRows(at: indexRows, with: UITableViewRowAnimation.none)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentMode == 0 {
            return imageName.count + 1
        }
        else {
            return 10
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "second", for: indexPath) as! SecondTableViewCell
            
            //cell.delegate = self
            
            return cell
        }
        else {
            if segmentMode == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "first", for: indexPath) as! FirstTableViewCell
            
                let ratio = CGFloat(imageWidth[indexPath.row - 1]) / tableView.frame.width
            
                cell.photoView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: CGFloat(imageHeight[indexPath.row - 1]) / ratio)
                cell.photoView.image = UIImage(named: imageName[indexPath.row - 1])
            
                self.indexRows.append(IndexPath(row: indexPath.row, section: indexPath.section))
            
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "second", for: indexPath) as! SecondTableViewCell
                
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 100
        }
        else {
            if segmentMode == 0 {
                let ratio = CGFloat(imageWidth[indexPath.row - 1]) / tableView.frame.width
            
                return (CGFloat(imageHeight[indexPath.row - 1]) / ratio) + cellGapHeight
            }
            else {
                return 50
            }
        }
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if secondCell != nil {
//            print(scrollView.contentOffset.y)
//            print(scrollView.contentSize.height - scrollView.frame.size.height)
//            
//            if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height)) {
//                secondCell.tableView.isScrollEnabled = true
//            }
//            else {
//                secondCell.tableView.isScrollEnabled = false
//            }
//        }
    }
    @IBAction func clickSegment(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            //tableView.deleteRows(at: indexRows, with: UITableViewRowAnimation.none)
            segmentMode = 0
            //imageName.removeAll()
            tableView.reloadData()
        }
        else {
            segmentMode = 1
            tableView.reloadData()
        }
    }
    
    func clickedSegment(index: Int) {
        
    }
    
}

