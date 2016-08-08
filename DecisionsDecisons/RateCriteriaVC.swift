//
//  RateCriteriaVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/7/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class RateCriteriaVC: UIViewController {
  
  @IBOutlet weak var criteriaTitle: UILabel!
  @IBOutlet var emptyStarCollection: [UIImageView]!
  
  var decision: Decision!
  var newChoice: Choice!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // SET DEFAULT WEIGHTS FOR CRITERION BEFORE LEAVING THIS VIEW
    // PUT NEWCHOICE INTO PROPER CONTEXT, PUT DECISION REFERENCE INTO NEWCHOICE, AND SAVE CONTEXT
  }
  
}
