//
//  RemoveStudentInfoViewController.swift
//  SQLite3
//
//  Created by 王磊 on 15/10/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

import UIKit

class RemoveStudentInfoViewController: UIViewController {
    
    var alert: UIAlertController?
    var nameTextField = TSTextFieldTool.customTF("姓名")
    var removeStudentInfoBtn = TSBtnTool.btn("移除")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configSubView()
    }
    
    func configSubView() {
        alert = UIAlertController(title: "如果有学生转班", message: "请根据提示操作", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { [weak self] (action: UIAlertAction!) -> Void in
            self!.dismissViewControllerAnimated(true, completion: nil)
        }
        alert!.addAction(action)
        
        //presentViewController(alert!, animated: true, completion: nil)
        
        let backgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImageView.image = UIImage(named: "background.jpg")
        view.addSubview(backgroundImageView)
        
        // nameTextField
        
        view.addSubview(nameTextField)
        nameTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(140)
            make.height.equalTo(kHeight)
        }
        nameTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        //
        view.addSubview(removeStudentInfoBtn)
        removeStudentInfoBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(nameTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        removeStudentInfoBtn.enabled = false
        removeStudentInfoBtn.addTarget(self, action: "removeStudentInfo", forControlEvents: .TouchUpInside)
        
    }
    func editingChanged() {
        removeStudentInfoBtn.enabled = !(nameTextField.text?.isEmpty)!
    }
    func removeStudentInfo() {
        
        if db.isExists("t_student", condition: "name='\(nameTextField.text!)'") {
            db.delete("t_student", condition: "name='\(nameTextField.text!)'")
            alertShow(alert!, title: "删除学生信息", message: "成功")
        } else {
            alertShow(alert!, title: "学生", message: "不存在")
        }
        nameTextField.text = ""
        presentViewController(alert!, animated: true, completion: nil)
    }
    
    func alertShow(alert: UIAlertController ,title: String ,message: String) {
        alert.title = title
        alert.message = message
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        alertShow(alert!, title: "如果有学生转班", message: "请根据提示操作")
        presentViewController(alert!, animated: true, completion: nil)
    }
}
