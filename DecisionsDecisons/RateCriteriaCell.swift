//
//  RateCriteriaCell.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/8/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

// ADD TOUCH HANDLERS TO EMPTY STAR IMAGES SO THEY CAN BE SELECTED AND PASS THAT SELECTION TO NEWCHOICE

class RateCriteriaCell: UITableViewCell {
  
  @IBOutlet weak var criteriaTitle: UILabel!
  @IBOutlet var emptyStarCollection: [UIImageView]!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    for star in emptyStarCollection {
      let tapGest = UITapGestureRecognizer(target: self, action: #selector(starTapped))
      star.userInteractionEnabled = true
      star.addGestureRecognizer(tapGest)
    }
    
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func starTapped(sender: UIImageView) {
    print(sender.tag)
  }
  
  func configureCell(withCriterion criterion: Criterion) {
    self.criteriaTitle.text = criterion.title!
  }
  
}
