//
//  Choice.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/30/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation
import CoreData


class Choice: NSManagedObject {
  
  // Insert code here to add functionality to your managed object subclass
  
  func returnAverageRating() -> Float {
    var sum: Float = 0
    if let criteria = self.criteria {
      for criterion in criteria {
        sum = sum + (criterion as? Criterion)!.returnWeightedRating()!
      }
    }
    return sum
  }
  
  func setDefaultWeight() {
    let weight = 1/Float((self.criteria?.count)!)
    if let criteria = self.criteria {
      for criterion in criteria {
        (criterion as? Criterion)!.setWeight(to: weight)
      }
    }
  }
  
  func returnRatingPct() -> Float {
    if let _ = self.criteria {
      return self.returnAverageRating()/5 // 5 is the highest rating
    }
    return 0
  }
  
}
