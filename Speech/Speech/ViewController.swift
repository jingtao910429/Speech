//
//  ViewController.swift
//  Speech
//
//  Created by Mac on 2017/9/10.
//  Copyright © 2017年 LiYou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let speech = Speech()
        speech.speed = 0.5
        speech.speakWords = "测试语音功能"
        speech.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

