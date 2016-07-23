//
//  ChoiceCell.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/21/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import UIKit
import CoreGraphics

class ChoiceCell: UITableViewCell {
  
  @IBOutlet weak var thumb: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var favImg: UIImageView! // add tap gesture recognizer to this?
  @IBOutlet weak var ratingImg: UIImageView!
  @IBOutlet weak var ratingImgWidth: NSLayoutConstraint!
  
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
    
    // clean up to remove magic numbers and have width.constant pull from choice average rating
    let originalImg = UIImage(named: "5 Stars")
    let ref: CGImageRef = CGImageCreateWithImageInRect(originalImg?.CGImage, CGRect(x: 0, y: 0, width: 300, height: 70))!
    self.ratingImg.image = UIImage(CGImage: ref)
    self.ratingImgWidth.constant = 150
    self.ratingImg.contentMode = .ScaleAspectFill
  }
  
}
