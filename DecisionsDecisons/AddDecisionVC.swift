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
  var newDecision: Decision? = nil
  var kbHeight: CGFloat!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    decisionNameTxtFld.becomeFirstResponder()
    self.hideKeyboardWhenTappedAround()
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    if let title = decisionNameTxtFld.text where title != "" {
      if let nd = NSEntityDescription.entityForName("Decision", inManagedObjectContext: appDel.managedObjectContext) {
        self.newDecision = NSManagedObject(entity: nd, insertIntoManagedObjectContext: nil) as? Decision
      }
        newDecision?.title = title
        performSegueWithIdentifier("nextStep", sender: self)
      } else {
        decisionNameTxtFld.backgroundColor = UIColor.redColor()
      }
    }
    
    @IBAction func textFieldChanged(sender: UITextField) {
      
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
