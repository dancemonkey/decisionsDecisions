//
//  ChoiceListVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/11/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class ChoiceListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var fetchedResultsController: NSFetchedResultsController!
  var decision: Decision!
  var newChoice: Choice!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attemptFetch()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    attemptFetch()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let choices = fetchedResultsController.fetchedObjects as? [Choice] {
      return choices.count
    }
    
    return 0
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("choiceCell", forIndexPath: indexPath) as! ChoiceCell
    configureCell(cell, indexPath: indexPath)
    return cell
    
  }
  
  func configureCell(cell: ChoiceCell, indexPath: NSIndexPath) {
    if let choice = fetchedResultsController.objectAtIndexPath(indexPath) as? Choice {
      cell.configureCell(withChoice: choice)
    }
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 115
  }
  
  func attemptFetch() {
    setFetchedResults()
    
    do {
      try  self.fetchedResultsController.performFetch()
    } catch {
      let error = error as NSError
      print("\(error)")
    }
  }
  
  func setFetchedResults() {
    let fetchRequest = NSFetchRequest(entityName: "Choice")
    let predicate = NSPredicate(format: "decision.title == %@", "\(self.decision.title)")
    let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    fetchRequest.predicate = predicate
    let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDel.managedObjectContext, sectionNameKeyPath: "title", cacheName: nil)
    controller.delegate = self
    fetchedResultsController = controller
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
    }
  }
  
  
  func controllerWillChangeContent(controller: NSFetchedResultsController) {
    tableView.beginUpdates()
  }
  
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    tableView.endUpdates()
  }
  
  func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    
    switch (type) {
    case .Insert:
      if let indexPath = newIndexPath {
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
      }
      break
    case .Delete:
      if let indexPath = newIndexPath {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
      }
      break
    case .Update:
      if let indexPath = indexPath {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! ChoiceCell
        configureCell(cell, indexPath: indexPath)
      }
      break
    case .Move:
      if let indexPath = newIndexPath {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
      }
      if let newIndexPath = newIndexPath {
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
      }
      break
    }
    
  }
  
}
