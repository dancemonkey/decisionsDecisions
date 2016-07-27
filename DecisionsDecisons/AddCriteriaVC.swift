//
//  AddCriteriaVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/3/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class AddCriteriaVC: UIViewController {
    
  @IBOutlet var criteriaTxtFld: [UITextField]!
  @IBOutlet weak var addNewCriteriaView: UIView!
  @IBOutlet weak var shadowView: UIView!
  var addNewCritViewTopConstraint: NSLayoutConstraint!
  
  weak var newDecision: Decision!
  var currentCriteriaFld = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = newDecision.title
    addNewCritViewTopConstraint = NSLayoutConstraint(item: addNewCriteriaView, attribute: .Top, relatedBy: .Equal, toItem: criteriaTxtFld[currentCriteriaFld], attribute: .Bottom, multiplier: 1.0, constant: 8.0)
    addNewCritViewTopConstraint.active = true
    criteriaTxtFld[currentCriteriaFld].becomeFirstResponder()
  }
  
  @IBAction func doneTapped(sender: UIButton) {
    for field in criteriaTxtFld {
      newDecision.baseCriteria.append(Criterion(title: field.text!))
    }
    Datasource.ds.addNew(decision: newDecision!)
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  
  @IBAction func addNewCriteriaTapped(sender: UIButton) {
    
    if criteriaTxtFld[currentCriteriaFld].text != "" && criteriaTxtFld[currentCriteriaFld].text != nil {

      currentCriteriaFld = currentCriteriaFld + 1
      criteriaTxtFld[currentCriteriaFld].hidden = false
      criteriaTxtFld[currentCriteriaFld].becomeFirstResponder()
      
      if criteriaTxtFld[4].hidden == true {
        // reset top constraint on AddNewCriteria view
        addNewCriteriaView.frame = criteriaTxtFld[currentCriteriaFld+1].frame
        addNewCritViewTopConstraint.active = false
        addNewCritViewTopConstraint = NSLayoutConstraint(item: addNewCriteriaView, attribute: .Top, relatedBy: .Equal, toItem: criteriaTxtFld[currentCriteriaFld], attribute: .Bottom, multiplier: 1.0, constant: 8.0)
        addNewCritViewTopConstraint.active = true
      } else {
        addNewCriteriaView.hidden = true
      }
    }
    
  }
  
}
