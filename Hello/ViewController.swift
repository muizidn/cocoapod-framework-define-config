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

    @IBAction func launchMyCustomPodsController(_ sender: Any) {
        let vc = createMyCustomController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! FW_myCustomPodsConfigure()
        
        print("SAY_WHAT", Bundle.main.object(forInfoDictionaryKey: "XCCONFIG_SAY_WHAT"))
        printSayWhat()
    }


}

