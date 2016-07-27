//
//  ViewController.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/21/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class DecisionListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var collection: UICollectionView!
  
  var decisionData = Datasource.ds.decisions
  var newDecision: Decision?
  var selectedCell: NSIndexPath!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collection.dataSource = self
    collection.delegate = self
  }
  
  override func viewWillAppear(animated: Bool) {
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
    self.performSegueWithIdentifier("ChoiceList", sender: self)
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    if let cell = collection.dequeueReusableCellWithReuseIdentifier("decisionCell", forIndexPath: indexPath) as? DecisionCell {
      cell.configCell(withDecision: decisionData[indexPath.row])
      return cell
    }
    return DecisionCell()
  }
  
  @IBAction func newDecisionTapped(sender: UIButton) {
    self.newDecision = Decision(title: "", choices: [Choice]())
    performSegueWithIdentifier("newDecisionSegue", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "newDecisionSegue" {
      if let destination = segue.destinationViewController as? AddDecisionVC {
        destination.newDecision = self.newDecision!
      }
    } else if segue.identifier == "ChoiceList" {
      if let destination = segue.destinationViewController as? ChoiceListVC {
        destination.decision = decisionData[selectedCell.row]
      }
    }
  }
  
}

