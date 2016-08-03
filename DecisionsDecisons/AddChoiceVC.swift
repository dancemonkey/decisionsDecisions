//
//  AddChoiceVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/24/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class AddChoiceVC: UIViewController {
  
  var newChoice: Choice!
  
  @IBOutlet weak var choiceTitleFld: UITextField!
  @IBOutlet weak var valueFld: UITextField!
  @IBOutlet weak var locationFld: UITextField!
  @IBOutlet weak var nextButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    choiceTitleFld.becomeFirstResponder()
    self.nextButton.enabled = false
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    newChoice.title = choiceTitleFld.text
    if let value = valueFld.text {
      // test for being a number and assign to newChoice.number
    }
    if let location = locationFld.text {
      newChoice.address = location
    }
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
    }
  }
  
}
