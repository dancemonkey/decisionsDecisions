//
//  IncludePhotoVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/30/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class IncludePhotoVC: UIViewController {
  
  weak var newDecision: Decision!
  @IBOutlet weak var photoSwitch: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(newDecision.title, newDecision.includePhoto, newDecision.mappable)
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    newDecision.includePhoto = photoSwitch.on
    performSegueWithIdentifier("nextStep", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "nextStep" {
      // pass newDecision to next step in the chain
      if let nextVC = segue.destinationViewController as? MappableVC {
        nextVC.newDecision = self.newDecision
      }
    }
  }
  
}
