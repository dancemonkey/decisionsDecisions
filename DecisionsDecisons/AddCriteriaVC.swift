//
//  AddCriteriaVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/3/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

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
  
  // TODO: test whether at least one field has a criteria in it
  @IBAction func doneTapped(sender: UIButton) {
        
    appDel.managedObjectContext.insertObject(self.newDecision)
    
    var criteria = Set<Criterion>()
    for field in criteriaTxtFld where field.text != "" {
      if let criterion = NSEntityDescription.insertNewObjectForEntityForName("Criterion", inManagedObjectContext: appDel.managedObjectContext) as? Criterion {
        criterion.title = field.text
        criterion.decision = self.newDecision
        criteria.insert(criterion)
      }
    }
    
    newDecision.baseCriteria = NSSet(set: criteria)
    
    do {
      try appDel.managedObjectContext.save()
    } catch {
      print("\(error)")
    }

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
