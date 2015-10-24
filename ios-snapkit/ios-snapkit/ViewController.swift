//
//  ViewController.swift
//  ios-snapkit
//
//  Created by Aaron Wang on 10/24/15.
//  Copyright © 2015 inetfuture. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topView = UIView()
        topView.backgroundColor = UIColor.blueColor()
        
        let bottomLeftView = UIView()
        bottomLeftView.backgroundColor = UIColor.yellowColor()
        
        let bottomRightView = UIView()
        bottomRightView.backgroundColor = UIColor.grayColor()
        
        self.view.addSubview(topView)
        self.view.addSubview(bottomLeftView)
        self.view.addSubview(bottomRightView)
        
        topView.snp_makeConstraints { (make) -> Void in
            make.top.right.left.equalTo(0)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.5)
        }
        
        bottomLeftView.snp_makeConstraints { (make) -> Void in
            make.left.bottom.equalTo(0)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.5)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.5)
        }
        
        bottomRightView.snp_makeConstraints { (make) -> Void in
            make.right.bottom.equalTo(0)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.5)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.5)
        }
        
        let logo = UIImageView(image: UIImage(named: "logo"))
        topView.addSubview(logo)
        logo.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(topView)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }        
        
        let tutorialsBtn = UIButton()
        tutorialsBtn.setTitle("Tutorials", forState: UIControlState.Normal)
        tutorialsBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        tutorialsBtn.backgroundColor = UIColor.redColor()
        bottomLeftView.addSubview(tutorialsBtn)
        
        let quizBtn = UIButton()
        quizBtn.setTitle("Quiz", forState: UIControlState.Normal)
        quizBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        quizBtn.backgroundColor = UIColor.redColor()
        bottomRightView.addSubview(quizBtn)
        
        tutorialsBtn.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(bottomLeftView.center)
            make.width.equalTo(100)
            make.height.equalTo(25)
        }
        
        quizBtn.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(bottomRightView.center)
            make.width.equalTo(100)
            make.height.equalTo(25)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

