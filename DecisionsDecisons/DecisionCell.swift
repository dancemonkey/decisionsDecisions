//
//  DecisionCell.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/25/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class DecisionCell: UICollectionViewCell {
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  
  func configCell(withDecision decision: Decision) {
    self.titleLabel.text = decision.title
    if let choices = decision.choices {
      self.countLabel.text = "\(choices.count) Choices"
      if let img = (Array(choices).first as? Choice)?.image {
        self.image.image = UIImage(data: img)
      } else {
        self.image.image = UIImage(named: "defaultDecImg")
      }
    }

  }
}
