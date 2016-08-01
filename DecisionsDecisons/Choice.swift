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
  
  func returnRatingPct() -> Float {
    return self.returnAverageRating()/5.0
  }
  
  
  
}
