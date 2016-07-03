//
//  AddCriteriaVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/3/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class AddCriteriaVC: UIViewController {
  
  weak var newDecision: Decision!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = newDecision.title
    
    // Do any additional setup after loading the view.
  }
  
}
