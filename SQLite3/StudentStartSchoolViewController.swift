//
//  ViewController.swift
//  SQLite3
//
//  Created by 王磊 on 15/10/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

import UIKit
let kScreenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
let kScreenHeight = CGRectGetHeight(UIScreen.mainScreen().bounds)
let kSpace = 15
let kHeight = 30
let kWidth = (kScreenWidth - CGFloat(3 * kSpace)) / 2
class StudentStartSchoolViewController: UIViewController {
    
    
    var nameTextField = TSTextFieldTool.customTF("姓名")
    var SIDTextField = TSTextFieldTool.customTF("身份证")
    var mobileTextField = TSTextFieldTool.customTF("手机号")
    var emailTextField = TSTextFieldTool.customTF("邮箱")
    var graduateSchoolTextField = TSTextFieldTool.customTF("毕业院校")
    var academicTextField = TSTextFieldTool.customTF("学历")
    var sexTextField = TSTextFieldTool.customTF("性别")
    var inputStudentInfoBtn = TSBtnTool.btn("录入")
    
    var alert: UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSubViews()
        
    }
    
    //MARK: configSubViews(
    func configSubViews() {
        //
        view.backgroundColor = UIColor.whiteColor()
        // background image
        let backgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImageView.image = UIImage(named: "background.jpg")
        view.addSubview(backgroundImageView)
        // describeLabel
        let describeLabel = TSLabelTool.label("基于sqlite3和本班学院写的一个小项目")
        view.addSubview(describeLabel)
        describeLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(66)
            make.height.equalTo(kHeight)
        }
        
        // inputStudentInfoLabel
        let inputStudentInfoLabel = TSLabelTool.label("开班了：录入学生信息")
        view.addSubview(inputStudentInfoLabel)
        inputStudentInfoLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(describeLabel.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        // nameTextField
        
        view.addSubview(nameTextField)
        nameTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.width.equalTo(kWidth)
            make.top.equalTo(inputStudentInfoLabel.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        // sexTextField
        
        view.addSubview(sexTextField)
        sexTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(nameTextField.snp_right).offset(kSpace)
            make.width.equalTo(kWidth)
            make.top.equalTo(inputStudentInfoLabel.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        
        // SIDTextField
        view.addSubview(SIDTextField)
        SIDTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(nameTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        // mobileTextField
        
        view.addSubview(mobileTextField)
        mobileTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(SIDTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        
        // emailTextField
        
        view.addSubview(emailTextField)
        emailTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(mobileTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        
        // graduateSchoolTextField
        view.addSubview(graduateSchoolTextField)
        graduateSchoolTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(emailTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        // academicTextField
        
        view.addSubview(academicTextField)
        academicTextField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(graduateSchoolTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        
        // add target
        nameTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        SIDTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        mobileTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        emailTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        graduateSchoolTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        academicTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        sexTextField.addTarget(self, action: "editingChanged", forControlEvents: .EditingChanged)
        
        //
        view.addSubview(inputStudentInfoBtn)
        inputStudentInfoBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(kSpace)
            make.right.equalTo(-kSpace)
            make.top.equalTo(academicTextField.snp_bottom).offset(kSpace)
            make.height.equalTo(kHeight)
        }
        inputStudentInfoBtn.enabled = false
        inputStudentInfoBtn.addTarget(self, action: "saveStudentInfo", forControlEvents: .TouchUpInside)
        
        
        initAlert()
        
    }
    // init alert
    func initAlert() {
        // TODO:....
        if  Float(UIDevice.currentDevice().systemVersion)! >= Float(8.0) {
            modalPresentationStyle = .CurrentContext
        }
        
        alert = UIAlertController(title: "", message: "录入学员信息成功", preferredStyle: .Alert)
    
        let action = UIAlertAction(title: "OK", style: .Default) { [weak self] (action: UIAlertAction!) -> Void in
            self!.performSelector("delay", withObject: nil, afterDelay: 1)
        }
        alert!.addAction(action)
    }
    func delay() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    // editingChanged
    func editingChanged() {
        inputStudentInfoBtn.enabled = !(nameTextField.text?.isEmpty)! && !(SIDTextField.text?.isEmpty)! && !(mobileTextField.text?.isEmpty)! && !(emailTextField.text?.isEmpty)! && !(graduateSchoolTextField.text?.isEmpty)! && !(academicTextField.text?.isEmpty)! && !(sexTextField.text?.isEmpty)!
    }
    // btnClick
    func saveStudentInfo() {
        print("aa")
        let name = nameTextField.text!
        let sid = SIDTextField.text!
        let mobile = mobileTextField.text!
        let email = emailTextField.text!
        let graduateSchool = graduateSchoolTextField.text!
        let academic = academicTextField.text!
        let sex = sexTextField.text!
        let sql = "insert into t_student(name,SID,mobile,email,graduateSchool,academic,sex) values('\(name)','\(sid)','\(mobile)','\(email)','\(graduateSchool)','\(academic)','\(sex)')"
        let result = db.execute(sql)
        print(result)
        presentViewController(alert!, animated: true, completion: nil)
        
        nameTextField.text = ""
        SIDTextField.text = ""
        mobileTextField.text = ""
        emailTextField.text = ""
        graduateSchoolTextField.text = ""
        academicTextField.text = ""
        sexTextField.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("memory 报警了")
    }
    
    
}

