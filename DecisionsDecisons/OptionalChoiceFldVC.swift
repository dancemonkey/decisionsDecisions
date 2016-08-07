//
//  OptionalChoiceFldVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/6/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class OptionalChoiceFldVC: UIViewController {
  
  @IBOutlet weak var imageAddBtn: UIButton!
  @IBOutlet weak var addressFld: UITextField!
  @IBOutlet weak var urlField: UITextField!
  
  var newChoice: Choice!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    // test for valid data, populate data in newChoice, then pass to next VC
  }

}
