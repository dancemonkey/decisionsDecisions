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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    collection.dataSource = self
    collection.delegate = self
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return decisionData.count
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    if let cell = collection.dequeueReusableCellWithReuseIdentifier("decisionCell", forIndexPath: indexPath) as? DecisionCell {
      cell.configCell(withDecision: decisionData[indexPath.row])
      return cell
    }
    return DecisionCell()
  }
  
}

