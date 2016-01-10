//
//  TSBtnTool.swift
//  May I want write something about login
//
//  Created by wanglei on 15/8/31.
//  Copyright © 2015年 wanglei. All rights reserved.
//

import UIKit

class TSBtnTool: NSObject {
    
    internal class func commonBtn(title: String)->UIButton {
        let btn = UIButton(type: .System)
        btn.setTitle(title, forState: .Normal)
        btn.setTitle(title, forState: .Highlighted)
        
        btn.alpha = 0.6
        btn.backgroundColor = UIColor.clearColor()
        btn.setTitleColor(UIColor.redColor(), forState: .Normal)
        btn.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        
        return btn
    }
    
    
    internal class func btn(title : String )->UIButton {
        let btn = UIButton(type: .RoundedRect)
        btn.setTitle(title, forState: .Normal)
        btn.setTitle(title, forState: .Highlighted)
        btn.layer.cornerRadius = 10.0
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        btn.alpha = 0.6
        btn.backgroundColor = UIColor.greenColor()
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        return btn
    }
    internal  class func btn(title: String ,image: String ,highlightedImage: String)->UIButton {
        let btn = UIButton(type: .RoundedRect)
        btn.setTitle(title, forState: .Normal)
        btn.setTitle(title, forState: .Highlighted)
        btn.layer.cornerRadius = 10.0
        btn.alpha = 0.6
        btn.backgroundColor = UIColor(red: 104 , green: 201, blue: 250, alpha: 1)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named: image), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: highlightedImage), forState: .Highlighted)
        return btn
    }
    // MARK: 文本下带有下划线的btn
    internal class func btnContainUnderLine(title: String , fontSize:CGFloat)->UIButton {
        let btn = UIButton(type: .RoundedRect)
        let attributes = [NSUnderlineStyleAttributeName : NSNumber(integer: NSUnderlineStyle.StyleSingle.rawValue) , NSFontAttributeName : UIFont(name: "Menlo-Regular", size: 20)! , NSUnderlineColorAttributeName : UIColor.redColor()]
        let attributeString = NSAttributedString(string: title, attributes: attributes)
        btn.setAttributedTitle(attributeString, forState: .Normal)
        btn.setAttributedTitle(attributeString, forState: .Highlighted)
        btn.backgroundColor = UIColor(red: 104 , green: 201, blue: 250, alpha: 1)
        btn.alpha = 0.5
        
        
        return btn
    }
    // MARK: the image is at the left the text is at the right
    internal class func customBtn(title: String , image: String)->UIButton {
        let btn = UIButton(type: .RoundedRect)
        btn.setTitle(title, forState: .Normal)
        btn.setTitle(title, forState: .Highlighted)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        //let offSet = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>))
        //btn.imageEdgeInsets
        //btn.titleEdgeInsets
        btn.layer.cornerRadius = 10.0
        btn.setImage(UIImage(named: image), forState: .Normal)
        btn.setImage(UIImage(named: image), forState: .Highlighted)
        
        
        return btn
    }
    // attributes
    internal class func customBtn(title: String ,isSelected: Bool)->UIButton {
        let btn = UIButton(type: .System )
        
        btn.selected = isSelected
        btn.setTitle(title, forState: .Normal)
        btn.setTitle(title, forState: .Selected)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: .Selected)
        
        btn.backgroundColor = btn.selected ? UIColor.grayColor() : UIColor.lightGrayColor()
        //
        btn.tintColor = UIColor.clearColor()
        //        btn.enabled = btn.selected ? false : true
        
        return btn
    }
    // attributes
    internal class func customBtn(title: String)->UIButton {
        let btn = UIButton(type: .System )
        
        btn.setTitle(title, forState: .Normal)
        btn.setTitle(title, forState: .Selected)
        btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn.setTitleColor(UIColor.redColor(), forState: .Selected)
        btn.backgroundColor = UIColor.whiteColor()
        //
        btn.tintColor = UIColor.clearColor()
        
        return btn
    }
    
    
    
    
}
