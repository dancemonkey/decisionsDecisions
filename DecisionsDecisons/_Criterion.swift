//
//  Criterion.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/22/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation

enum Rating: Int {
  case notRated = 0, oneStar, twoStar, threeStar, fourStar, fiveStar
}

class _Criterion {
  
  private var _title: String                    // only value NEEDED when creating criterion
  var title: String {
    return _title
  }
  
  private var _rating: Rating = .notRated       // not needed when creating criterion, set to zero
  var rating: Rating {
    return _rating
  }
  
  private var _weight: Float?                   // weight is optional, defaults to even distribution over all criteria
  var weight: Float? {
    return _weight
  }
  
  init(title: String) {
    self._title = title
  }
  
  func returnWeightedRating() -> Float? {
    if let wt = _weight {
      return Float(_rating.rawValue) * wt
    } else {
      print("You forget to set the default weighted values!")
      return nil
    }
  }
  
  func setWeight(to weight: Float) {
    self._weight = weight
  }
  
  func setTitle(to title: String) {
    self._title = title
  }
  
  func setRating(to rating: Rating) {
    self._rating = rating
  }
  
}
