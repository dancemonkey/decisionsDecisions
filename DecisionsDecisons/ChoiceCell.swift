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
  // TODO: add tap gesture to favImg so you can fav the choice
  @IBOutlet weak var favImg: UIImageView!
  @IBOutlet weak var emptyStarImg: UIImageView!
  @IBOutlet weak var ratingImg: UIImageView!
  @IBOutlet weak var ratingImgWidth: NSLayoutConstraint!
  
  let deviceScale = UIScreen.mainScreen().scale
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  func configureCell(withChoice choice: Choice) {
    if let image = choice.image {
      self.thumb.image = UIImage(data: image)
    } else {
      self.thumb.image = UIImage(named: "defaultDecImg")
    }
    
    self.title.text = choice.title
    self.favImg.image = UIImage(named: "FavEmpty")
    
    // TODO: fix, currently only displays properly on device scale of 2x
    
    let originalImg = UIImage(named: "5 Stars")
    let imgWidth = emptyStarImg.frame.width * deviceScale
    let ratingPct:CGFloat = CGFloat(choice.returnRatingPct())
    let ratingMultiplier = ratingPct > 0 ? ratingPct : 1
    let rect = CGRect(x: 0, y: 0, width: imgWidth*ratingMultiplier, height: 70)
    let ref: CGImageRef = CGImageCreateWithImageInRect(originalImg?.CGImage, rect)!
    self.ratingImg.image = UIImage(CGImage: ref)
    self.ratingImgWidth.constant = rect.width/deviceScale
    self.ratingImgWidth.active = true
    self.ratingImg.contentMode = .ScaleAspectFill
  }
  
}
