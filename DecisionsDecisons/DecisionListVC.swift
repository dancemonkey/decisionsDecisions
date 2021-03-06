//
//  ViewController.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/21/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class DecisionListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var collection: UICollectionView!
  
  var decisionData: [Decision]!
  var newDecision: Decision?
  var selectedCell: NSIndexPath!
  
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
    performSegueWithIdentifier("newDecisionSegue", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "newDecisionSegue" {
      
    } else if segue.identifier == "ChoiceList" {
      if let destination = segue.destinationViewController as? ChoiceListVC {
        destination.decision = decisionData[((sender as? NSIndexPath)?.row)!]
      }
    }
  }
  
}

