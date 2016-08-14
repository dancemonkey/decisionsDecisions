//
//  RatingStarImageView.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/13/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class RatingStarImageView: UIImageView {

  private var selected: Bool = false
  
  func select() {
    self.selected = true
    super.image = UIImage(named: "Single Full Star")
  }
  
  func deSelect() {
    self.selected = false
    super.image = UIImage(named: "Single Empty Star")
  }
  
  func isSelected() -> Bool {
    return self.selected
  }

}
