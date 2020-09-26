//
//  ViewController.swift
//  Hello
//
//  Created by Muis on 26/09/20.
//  Copyright © 2020 Muis. All rights reserved.
//

import UIKit
import MyCustomPods

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SAY_WHAT", Bundle.main.object(forInfoDictionaryKey: "XCCONFIG_SAY_WHAT"))
        printSayWhat()
    }


}

