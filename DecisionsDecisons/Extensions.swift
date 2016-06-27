//
//  Extensions.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/26/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }
}