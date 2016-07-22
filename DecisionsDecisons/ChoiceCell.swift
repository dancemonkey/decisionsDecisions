//
//  ChoiceCell.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/21/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit

class ChoiceCell: UITableViewCell {
  
  @IBOutlet weak var thumb: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var favImg: UIImageView! // add tap gesture recognizer to this?
  @IBOutlet weak var ratingImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func configureCell(withChoice choice: Choice) {
    if let imgURL = choice.imgURL where imgURL != "" {
      self.thumb.image = UIImage(named: imgURL)
    } else {
      self.thumb.image = UIImage(named: "defaultDecImg")
    }
    self.title.text = choice.title
    self.favImg.image = UIImage(named: "FavEmpty")

    // returning 3 stars, but eventually need to return the actual rating (full stars plus partial for the final star based on the average rating returned
    self.ratingImg.image = UIImage(named: "3 Stars")
  }

}
