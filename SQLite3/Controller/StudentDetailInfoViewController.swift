//
//  StudentDetailInfoViewController.swift
//  SQLite3
//
//  Created by 王磊 on 15/10/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

import UIKit

class StudentDetailInfoViewController: UITableViewController {
    
    var studentDetailInfo: SQLRow!
    
    var allKeys: Array<String> = ["name","sex","SID","mobile","email","graduateSchool","academic"]
    var allSectionHeaderTexts: Array<String> = ["姓名","性别","身份证号","手机号","邮箱","毕业院校","学历"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        tableView.bounces = false
        tableView.backgroundColor = UIColor.clearColor()
        // background image
        let backgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImageView.image = UIImage(named: "background.jpg")
        tableView.backgroundView = backgroundImageView
        
        view.bringSubviewToFront(tableView)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return allKeys.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == Optional.None {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = studentDetailInfo[allKeys[indexPath.section]]?.asString()
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(30)
        cell?.backgroundColor = UIColor.clearColor()
        return cell!
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let aView = UILabel()
        aView.text = allSectionHeaderTexts[section]
        aView.font = UIFont.boldSystemFontOfSize(20)
        aView.backgroundColor = UIColor.clearColor()
        return aView
    }
    
    
}
