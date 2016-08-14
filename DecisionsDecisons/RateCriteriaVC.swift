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
  var tempCriteria = [Criterion]()
  
  @IBOutlet weak var tableview: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableview.dataSource = self
    tableview.delegate = self
    
    if let criteria = decision.baseCriteria?.allObjects as? [Criterion] {
      tempCriteria = criteria
    }
  }
  
  @IBAction func doneTapped(sender: AnyObject) {
    appDel.managedObjectContext.insertObject(newChoice)
    newChoice.decision = decision
    newChoice.criteria = decision.baseCriteria
    newChoice.setDefaultWeight()
    
    do {
      try appDel.managedObjectContext.save()
    } catch {
      print("\(error)")
    }
    
    for controller in (self.navigationController?.viewControllers)! {
      if controller.isKindOfClass(ChoiceListVC) {
        self.navigationController?.popToViewController(controller as UIViewController, animated: true)
      }
    }
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tempCriteria.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCellWithIdentifier("rateCriteriaCell") as? RateCriteriaCell {
      cell.configureCell(withCriterion: (tempCriteria[indexPath.row]))
      return cell
    }
    return RateCriteriaCell()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // PASS INDEX PATH TO SELECTED ROW, SO DATA CAN BE UPDATED FROM THE CELL AFTER USER RATES THE CRITERIA
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 125
  }
  
}
