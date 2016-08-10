//
//  Criterion.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/30/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation
import CoreData

enum Rating: Int {
  case notRated = 0, oneStar, twoStar, threeStar, fourStar, fiveStar
}

class Criterion: NSManagedObject {
  
  func returnWeightedRating() -> Float? {
    if let wt = weight?.floatValue {
      return (rating?.floatValue)! * wt
    } else {
      print("You forget to set the default weighted values!")
      return nil
    }
  }
  
  func setWeight(to weight: Float) {
    self.weight = weight
  }
  
  func setRating(to rating: Rating) {
    self.rating = rating.rawValue
  }

}
