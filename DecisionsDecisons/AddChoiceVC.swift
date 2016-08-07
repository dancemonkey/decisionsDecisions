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
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    if let title = choiceTitleFld.text {
      newChoice.title = title
      if let valueStr = valueFld.text, let valueNum = Int(valueStr) {
        newChoice.value = valueNum
      }
      if let location = locationFld.text {
        newChoice.address = location
      }
      performSegueWithIdentifier("nextStep", sender: self)
    } else {
      choiceTitleFld.backgroundColor = UIColor.redColor()
    }
  }
  
  @IBAction func textFieldChanged(sender: UITextField) {

  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "nextStep" {
      // pass newChoice to next step in the chain
      if let destVC = segue.destinationViewController as? OptionalChoiceFldVC {
        destVC.newChoice = self.newChoice
      }
    }
  }
  
}
