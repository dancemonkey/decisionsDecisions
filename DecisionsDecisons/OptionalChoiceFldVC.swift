//
//  OptionalChoiceFldVC.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/6/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreData

class OptionalChoiceFldVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  // TODO: subclass and style imageAddBtn
  @IBOutlet weak var imageAddBtn: UIButton! 
  @IBOutlet weak var addressFld: UITextField!
  @IBOutlet weak var urlField: UITextField!
  
  let imagePicker = UIImagePickerController()
  
  var newChoice: Choice!
  var decision: Decision!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
  }
  
  @IBAction func nextBtnTapped(sender: UIButton) {
    if let address = addressFld.text {
      newChoice.address = address
    }
    if let url = urlField.text {
      newChoice.url = url
    }
    performSegueWithIdentifier("nextStep", sender: self)
  }
  
  @IBAction func imageBtnTapped(sender: UIButton) {
    
    imagePicker.allowsEditing = false
    presentViewController(imagePicker, animated: true, completion: nil)
    
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      imageAddBtn.setBackgroundImage(pickedImage, forState: .Normal)
      imageAddBtn.setTitle("", forState: .Normal)
      newChoice.image = UIImagePNGRepresentation(pickedImage)
    }
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "nextStep" {
      if let destVC = segue.destinationViewController as? RateCriteriaVC {
        destVC.decision = self.decision
        destVC.newChoice = self.newChoice
      }
    }
  }
  
}
