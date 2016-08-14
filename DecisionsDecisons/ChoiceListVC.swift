//
//  ChoiceListVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/11/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class ChoiceListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var decision: Decision!
  var newChoice: Choice!
  var choiceList: [Choice]!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if let choices = decision.choices {
      choiceList = Array(choices) as? [Choice]
    }
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return choiceList.count
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("choiceSelected", sender: choiceList[indexPath.row])
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("choiceCell", forIndexPath: indexPath) as! ChoiceCell
    configureCell(cell, indexPath: indexPath)
    return cell
    
  }
  
  func configureCell(cell: ChoiceCell, indexPath: NSIndexPath) {
    cell.configureCell(withChoice: choiceList[indexPath.row])
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 115
  }
  
  @IBAction func newChoiceTapped(sender: UIButton) {
    if let nc = NSEntityDescription.entityForName("Choice", inManagedObjectContext: appDel.managedObjectContext) {
      self.newChoice = NSManagedObject(entity: nc, insertIntoManagedObjectContext: nil) as? Choice
      performSegueWithIdentifier("newChoiceSegue", sender: self)
    }
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "newChoiceSegue" {
      if let destVC = segue.destinationViewController as? AddChoiceVC {
        destVC.newChoice = self.newChoice
        destVC.decision = self.decision
      }
    } else if segue.identifier == "choiceSelected" {
      if let destVC = segue.destinationViewController as? ChoiceVC {
        destVC.choice = sender as? Choice
      }
    }
  }
  
}
