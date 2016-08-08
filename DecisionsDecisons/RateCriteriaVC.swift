//
//  RateCriteriaVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/7/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class RateCriteriaVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
  var decision: Decision!
  var newChoice: Choice!
  var ratingSelections = [Rating]()
  
  @IBOutlet weak var tableview: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableview.dataSource = self
    tableview.delegate = self
    
    // PUT NEWCHOICE INTO PROPER CONTEXT, PUT DECISION REFERENCE INTO NEWCHOICE, AND SAVE CONTEXT
    // SET DEFAULT WEIGHTS FOR ALL CRITERION WHEN LOADING THIS VIEW
  }
  
  @IBAction func doneTapped(sender: AnyObject) {
    appDel.managedObjectContext.insertObject(newChoice)
    newChoice.decision = decision
    newChoice.criteria = decision.baseCriteria
    
    // SET NEWCHOICE CRITERIA RATINGS TO WHAT WAS SELECTED IN THE TABLE CELLS
    // ALSO POP BACK TO CHOICE LIST VC AND REFRESH TABLE
    
    do {
      try appDel.managedObjectContext.save()
    } catch {
      print("\(error)")
    }
    
    

  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = newChoice.criteria?.count {
      return count
    }
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return RateCriteriaCell()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // PASS INDEX PATH TO SELECTED ROW, SO DATA CAN BE UPDATED FROM THE CELL AFTER USER RATES THE CRITERIA
  }
  
}
