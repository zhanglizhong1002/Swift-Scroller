//
//  ViewController.swift
//  UIScrollerDemo
//
//  Created by Mac mini on 2017/6/5.
//  Copyright © 2017年 bubukj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var testArray = ["测试1", "测试2", "测试3", "测试4", "测试5", "测试6", "测试7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Slide"
        
        let slideView = SlideScrollerView(frame: CGRect(x: 0.0, y: 64.0, width: self.view.bounds.size.width, height: 44), titleArray: testArray as NSArray)
        view.addSubview(slideView)
        
        slideView.clickIndex = { (value: Int) in
            
            print(value)
            
            /**
             *  RGB 随机颜色
             */
            let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
            let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            let alpha = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            
            let color = UIColor.init(red:red, green:green, blue:blue , alpha: alpha)
            self.view.backgroundColor = color
        }
        
    }

   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let vc = TestViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

