//
//  ViewController.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/21/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class DecisionListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, NSFetchedResultsControllerDelegate {
  
  @IBOutlet weak var collection: UICollectionView!
  
  var decisionData: [Decision]!
  var newDecision: Decision?
  var selectedCell: NSIndexPath!
  
  var fetchedResultsController: NSFetchedResultsController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setData()
    collection.dataSource = self
    collection.delegate = self
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    setData()
  }
  
  func setData() {
    Datasource.ds.fetchDecisions()
    decisionData = Datasource.ds.decisions
    collection.reloadData()
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return decisionData.count
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    selectedCell = indexPath
    self.performSegueWithIdentifier("ChoiceList", sender: indexPath)
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    if let cell = collection.dequeueReusableCellWithReuseIdentifier("decisionCell", forIndexPath: indexPath) as? DecisionCell {
      configureCell(cell, indexPath: indexPath)
      return cell
    }
    return DecisionCell()
  }
  
  func configureCell(cell: DecisionCell, indexPath: NSIndexPath) {
    cell.configCell(withDecision: decisionData[indexPath.row])
  }
  
  @IBAction func newDecisionTapped(sender: UIButton) {
    //    if let nd = NSEntityDescription.entityForName("Decision", inManagedObjectContext: appDel.managedObjectContext) {
    //      self.newDecision = NSManagedObject(entity: nd, insertIntoManagedObjectContext: appDel.managedObjectContext) as? Decision
    //      // if this is inserted then does that mean it will remain there until I save or remove it? I think yes?
    //      // see what homey did in the Core Data video to handle this
    //    }
    performSegueWithIdentifier("newDecisionSegue", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "newDecisionSegue" {
      //      if let destination = segue.destinationViewController as? AddDecisionVC {
      //        destination.newDecision = self.newDecision
      //      }
    } else if segue.identifier == "ChoiceList" {
      if let destination = segue.destinationViewController as? ChoiceListVC {
        destination.decisionTitle = decisionData[((sender as? NSIndexPath)?.row)!].title
      }
    }
  }
  
}

