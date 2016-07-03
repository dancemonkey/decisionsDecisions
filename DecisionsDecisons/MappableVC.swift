//
//  MappableVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/2/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class MappableVC: UIViewController {
  
  weak var newDecision: Decision!
  
  @IBOutlet weak var mappableSwitch: UISwitch!
  
  override func viewDidLoad() {
    self.title = newDecision.title
    super.viewDidLoad()
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    newDecision.mappable = mappableSwitch.on
    performSegueWithIdentifier("nextStep", sender: self)
  }
  
  @IBAction func mapSwitchSet(sender: UISwitch) {
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "nextStep" {
      if let nextVC = segue.destinationViewController as? AddCriteriaVC {
        nextVC.newDecision = self.newDecision
      }
    }
  }
}

