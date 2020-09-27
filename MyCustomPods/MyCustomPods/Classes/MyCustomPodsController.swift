//
//  MyCustomPodsController.swift
//  MyCustomPods
//
//  Created by Muis on 27/09/20.
//

import UIKit

public func createMyCustomController() -> MyCustomPodsController {
    return MyCustomPodsController(nibName: "MyCustomPodsController", bundle: BundleOfMyCustomPods_Bundle)
}

public final class MyCustomPodsController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labelGoodMorning: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        label.font = UIFont(name: "Roboto-BoldItalic", size: 17)!
        
        labelGoodMorning.text = NSLocalizedString("Good Morning", tableName: "Localization", bundle: BundleOfMyCustomPods_Bundle!, value: "", comment: "hello")
    }
}
