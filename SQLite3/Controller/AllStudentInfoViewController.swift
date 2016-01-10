//
//  AllStudentInfoViewController.swift
//  SQLite3
//
//  Created by 王磊 on 15/10/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

import UIKit

class AllStudentInfoViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate {
    
    var data: Array<SQLRow>!
    var tableView : UITableView?
    var backgroundImageView: UIImageView?
    
    var alert: UIAlertController?
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImageView!.image = UIImage(named: "background.jpg")
        view.addSubview(backgroundImageView!)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight))
        tableView?.backgroundColor = UIColor.clearColor()
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.separatorStyle = .None
        view.addSubview(tableView!)
        alert = UIAlertController(title: "还没有录入学员信息", message: "请录入学员信息", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default) { [weak self] (action: UIAlertAction!) -> Void in
            self!.dismissViewControllerAnimated(true, completion: nil)
        }
        alert!.addAction(action)
        
       
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        data = db.query("select * from t_student")
        if data.count == 0 {
            presentViewController(alert!, animated: true, completion: nil)
        } else {
            tableView?.reloadData()
        }
    }
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == Optional.None {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        var dict: SQLRow!
        if data.count > 0 {
            dict = data[indexPath.row] as SQLRow
        }
        cell?.backgroundColor = UIColor.clearColor()
        cell?.textLabel?.text = dict["name"]?.asString()
        cell?.detailTextLabel?.text = dict["mobile"]?.asString()
        let blackLine = UIView(frame: CGRect(x: 0, y: 59, width: kScreenWidth, height: 1))
        blackLine.backgroundColor = UIColor.blackColor()
        cell?.contentView.addSubview(blackLine)
        
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let selectedStudent = data[indexPath.row] as SQLRow
        
        let studentDetailInfoVC = StudentDetailInfoViewController()
        
        studentDetailInfoVC.studentDetailInfo = selectedStudent
        
        navigationController?.pushViewController(studentDetailInfoVC, animated: true)
        
    }
    
}
