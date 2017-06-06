//
//  SlideScrollerView.swift
//  UIScrollerDemo
//
//  Created by Mac mini on 2017/6/5.
//  Copyright © 2017年 bubukj. All rights reserved.
//

import UIKit


typealias clickIndexBlock = (_ v:Int) ->Void

class SlideScrollerView: UIView {
    
    
    var clickIndex:clickIndexBlock!
    
    var kindScroller: UIScrollView!
    var titleArray = NSArray()
    
    lazy var slideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, titleArray: NSArray) {
        self.init(frame: frame)
        self.titleArray = titleArray
        
        self.setUpSlideScrollerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpSlideScrollerView() {
        
        let width = self.bounds.size.width/5.0
        
        
        kindScroller = UIScrollView()
        kindScroller.frame = self.bounds
        kindScroller.backgroundColor = UIColor.gray
        kindScroller.contentSize = CGSize(width: CGFloat(width)*CGFloat(titleArray.count), height: 0)
        kindScroller.showsVerticalScrollIndicator = false
        kindScroller.showsHorizontalScrollIndicator = false
        self.addSubview(kindScroller)
        
        for i in 0...titleArray.count-1 {
            
            let btn = UIButton()
            btn.tag = i+100
            btn.frame = CGRect(x: CGFloat(width)*CGFloat(i), y: 0.0, width: width, height: self.bounds.size.height)
            btn.setTitle(titleArray[i] as? String, for: UIControlState.normal)
            btn.backgroundColor = UIColor.blue
            btn.setTitleColor(UIColor.brown, for: UIControlState.normal)
            btn.addTarget(self, action: #selector(btnSelectAction(btn:)), for: UIControlEvents.touchUpInside)
            kindScroller.addSubview(btn)
            
            if i == 0 {
                btn.backgroundColor = UIColor.blue
                btn.setTitleColor(UIColor.red, for: UIControlState.normal)
            }
            
        }
        
        
        slideView.frame = CGRect(x: 0, y: self.bounds.size.height-3, width: width, height: 3)
        kindScroller.addSubview(slideView)
    }
    
    
    func btnSelectAction(btn: UIButton) {
        
        let width = self.bounds.size.width/5.0
        
        for i in 100...100+titleArray.count-1 {
            
            let btn = self.viewWithTag(i) as! UIButton
            btn.backgroundColor = UIColor.darkGray
            btn.setTitleColor(UIColor.darkText, for: UIControlState.normal)
            
        }
        
        btn.backgroundColor = UIColor.blue
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.slideView.frame = CGRect(x: CGFloat(btn.tag-100)*width, y: self.bounds.size.height-3, width: width, height: 3)
        }) { (finished) in
            
            if (self.clickIndex != nil) {
                
            self.clickIndex!(btn.tag-100)
        }
        }
    }
}
