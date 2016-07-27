//
//  ChoiceListVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/11/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class ChoiceListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  weak var decision: Decision!
  var newChoice: Choice?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return decision.choices.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("choiceCell") as! ChoiceCell
    cell.configureCell(withChoice: decision.choices[indexPath.row])
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 115
  }
  
  
  @IBAction func newChoiceTapped(sender: UIButton) {
    self.newChoice = Choice(title: "")
    performSegueWithIdentifier("newChoiceSegue", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "newChoiceSegue" {
      if let destVC = segue.destinationViewController as? AddChoiceVC {
        destVC.newChoice = self.newChoice
      }
    }
  }
  
}
