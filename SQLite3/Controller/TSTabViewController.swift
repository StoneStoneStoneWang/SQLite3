//
//  TSTabViewController.swift
//  SQLite3
//
//  Created by 王磊 on 15/10/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

import UIKit

class TSTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let studentRegisterVC = StudentStartSchoolViewController()
        let studentNavi = UINavigationController(rootViewController: studentRegisterVC)
        studentRegisterVC.title = "入学登记"
        
        let studentInfoVC = AllStudentInfoViewController()
        let studentInfoNavi = UINavigationController(rootViewController: studentInfoVC)
        studentInfoVC.title = "学员信息"
        
        let removeStudentInfoVC = RemoveStudentInfoViewController()
        let removeStudentInfoNavi = UINavigationController(rootViewController: removeStudentInfoVC)
        removeStudentInfoVC.title = "删除学生信息"
        
        viewControllers = [studentNavi,studentInfoNavi,removeStudentInfoNavi]
    }
}
