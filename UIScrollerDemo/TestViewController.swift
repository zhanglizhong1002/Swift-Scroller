//
//  TestViewController.swift
//  UIScrollerDemo
//
//  Created by Mac mini on 2017/6/5.
//  Copyright © 2017年 bubukj. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var testArray = ["测试1", "测试2", "测试3", "测试4", "测试5", "测试6", "测试7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.title = "Slide"
        
        let slideView = SlideScrollerView(frame: CGRect(x: 0.0, y: 100.0, width: self.view.bounds.size.width, height: 44), titleArray: testArray as NSArray)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
