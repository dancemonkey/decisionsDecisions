//
//  BuildAdvanceCustomBtn.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/6/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class BuildAdvanceCustomBtn: UIButton {

  override func awakeFromNib() {
    super.awakeFromNib()
    setTitleAttributes()
  }
  
  func setTitleAttributes() {
    if self.currentTitle != nil {
      self.setTitle(self.currentTitle?.uppercaseString, forState: .Normal)
      self.titleLabel?.font = UIFont(name: "SF UI Display", size: 22.0)
    }
  }

}
