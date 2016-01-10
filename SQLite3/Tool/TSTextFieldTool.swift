//
//  TSCustomTextField.swift
//  May I want write something about login
//
//  Created by wanglei on 15/8/29.
//  Copyright © 2015年 wanglei. All rights reserved.
//

import UIKit

class TSTextFieldTool: NSObject {
    
    // custom textField
    internal class func customTextField(string : String)->UITextField{
        let tf = UITextField()
        tf.textColor = UIColor.whiteColor()
        
        tf.attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
        
        // 设置光标颜色
        tf.setValue(UIColor.blackColor(), forKeyPath: "tintColor")
        //UITextField.appearance().tintColor = UIColor.redColor() 设置全部
        //tf.tintColor = UIColor.redColor()
        tf.leftViewMode = .Never // 左边视图 总是显示
        tf.autocapitalizationType = .None //
        tf.autocorrectionType = .No // 是否纠错
        tf.returnKeyType = .Next
        tf.clearButtonMode = .WhileEditing
        tf.textAlignment = .Left
        tf.clearsOnBeginEditing = true // 开始编辑 就清空
        tf.font = UIFont(name: "Arial", size: 15.0)

        // 设置背景 这里需要一个背景图
        tf.disabledBackground = UIImage(named: "aaa")
        return tf
    }
    internal class func customTF(placeholder: String)->UITextField {
        let tf = UITextField()
        tf.textColor = UIColor.blueColor()
        tf.layer.cornerRadius = 10.0
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.grayColor().CGColor
        tf.placeholder = placeholder
        
        tf.tintColor = UIColor.blueColor()
        return tf
    }
}
