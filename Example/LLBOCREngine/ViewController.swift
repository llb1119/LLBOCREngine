//
//  ViewController.swift
//  LLBOCREngine
//
//  Created by liulibo on 07/14/2016.
//  Copyright (c) 2016 liulibo. All rights reserved.
//

import UIKit
import LLBOCREngine
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle(forClass: LLBOCREngine.MyClass)
        print("framework path is \(path)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

