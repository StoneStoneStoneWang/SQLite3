//
//  TSLabelTool.swift
//  May I want write something about login
//
//  Created by wanglei on 15/8/31.
//  Copyright © 2015年 wanglei. All rights reserved.
//

import UIKit

class TSLabelTool: NSObject {
    
    internal class func label(title : String)->UILabel {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: "Menlo Regular", size: 15)
        label.backgroundColor = UIColor.clearColor()
        label.text = title
        label.textColor = UIColor.blackColor()
        label.shadowColor = UIColor.yellowColor()
        label.shadowOffset = CGSize(width: 0.6, height: 0.6)
        label.layer.cornerRadius = 10.0
        label.layer.borderColor = UIColor.redColor().CGColor
        label.layer.borderWidth = 0.5
        return label
    }
    internal class func customLabel(title: String)->UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Left
        label.text = title
        label.textColor = UIColor.blackColor()
        
        return label
    }
    internal class func label()->UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Left
        
        label.textColor = UIColor.blackColor()
        return label
    }
}
