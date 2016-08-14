//
//  RateCriteriaCell.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 8/8/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class RateCriteriaCell: UITableViewCell {
  
  @IBOutlet weak var criteriaTitle: UILabel!
  @IBOutlet var emptyStarCollection: [RatingStarImageView]!
  weak var criterion: Criterion?
  
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
    
  }
  
  func starTapped(sender: UITapGestureRecognizer) {
    
    let tappedStar = (sender.view?.tag)!-1
    let rating = Rating(rawValue: sender.view!.tag)
    self.criterion!.setRating(to: rating!)
    
    // SET ALL STARS UP TO TAPPED STAR TO THE SELECTED STATE
    var counter = 0
    repeat {
      emptyStarCollection[counter].select()
      counter = counter + 1
    } while counter <= tappedStar
    
    // SET THE REMAINING STARS TO THE DESELECTED STATE
    if tappedStar < emptyStarCollection.count - 1 {
      var counter = tappedStar + 1
      repeat {
        emptyStarCollection[counter].deSelect()
        counter = counter + 1
      } while counter < emptyStarCollection.count
    }
  }
  
  func configureCell(withCriterion criterion: Criterion) {
    self.criteriaTitle.text = criterion.title!
    self.criterion = criterion
  }
  
}
