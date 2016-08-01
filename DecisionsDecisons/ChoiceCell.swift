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
  
  let deviceScale = UIScreen.mainScreen().scale
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configureCell(withChoice choice: Choice) {
    if let image = choice.image {
      self.thumb.image = UIImage(data: image)
    } else {
      self.thumb.image = UIImage(named: "defaultDecImg")
    }
    
    self.title.text = choice.title
    self.favImg.image = UIImage(named: "FavEmpty")
    
    // currently only displays properly on device scale of 2x
    
    let originalImg = UIImage(named: "5 Stars")
    let imgWidth = ratingImg.frame.width * deviceScale
    let ratingPct:CGFloat = CGFloat(choice.returnRatingPct())
    let rect = CGRect(x: 0, y: 0, width: imgWidth*ratingPct, height: 70)
    let ref: CGImageRef = CGImageCreateWithImageInRect(originalImg?.CGImage, rect)!
    self.ratingImg.image = UIImage(CGImage: ref)
    self.ratingImgWidth.constant = rect.width/deviceScale
    self.ratingImg.contentMode = .ScaleAspectFill
  }
  
}
