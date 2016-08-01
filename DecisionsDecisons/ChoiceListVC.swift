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
  
  //  weak var decision: Decision!
  //  var newChoice: Choice?
  var fetchedResultsController: NSFetchedResultsController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
    
    if let choices = fetchedResultsController.fetchedObjects {
      let choiceInfo = choices[0]
      return choiceInfo.numberOfObjects
    }
    
    return 0
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("ChoiceCell", forIndexPath: indexPath) as! ChoiceCell
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
    let sortDescriptor = NSSortDescriptor(key: "Title", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDel.managedObjectContext, sectionNameKeyPath: "Section", cacheName: nil)
    controller.delegate = self
    fetchedResultsController = controller
  }
  
  
  @IBAction func newChoiceTapped(sender: UIButton) {
    let newChoice = NSEntityDescription.insertNewObjectForEntityForName("Choices", inManagedObjectContext: appDel.managedObjectContext) as? Choice
    performSegueWithIdentifier("newChoiceSegue", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "newChoiceSegue" {
      if let destVC = segue.destinationViewController as? AddChoiceVC {
        //destVC.newChoice = newChoice
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
      if let indexPath = newIndexPath {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! ChoiceCell
        // update cell data
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
