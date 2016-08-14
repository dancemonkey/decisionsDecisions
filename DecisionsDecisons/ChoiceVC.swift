//
//  ChoiceVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/13/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class ChoiceVC: UIViewController {
  
  var choice: Choice!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = choice.title
    
  }
  
}
