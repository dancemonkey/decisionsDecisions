//
//  AddDecisionVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/26/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class AddDecisionVC: UIViewController {
  
  @IBOutlet weak var decisionNameTxtFld: UITextField!
  @IBOutlet weak var nextButton: UIButton!
  var newDecision: Decision?
  var kbHeight: CGFloat!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.hideKeyboardWhenTappedAround()
    
    self.nextButton.enabled = false
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    self.newDecision?.title = decisionNameTxtFld.text!
    performSegueWithIdentifier("nextStep", sender: self)
  }
  
  @IBAction func textFieldChanged(sender: UITextField) {
    if sender.text != nil && sender.text != "" {
      self.nextButton.enabled = true
    } else {
      self.nextButton.enabled = false
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "nextStep" {
      // pass newDecision to next step in the chain
      if let nextVC = segue.destinationViewController as? AddCriteriaVC {
        nextVC.newDecision = self.newDecision
      }
    }
  }

}
