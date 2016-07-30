//
//  Choice.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/22/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation

class _Choice {
  
  private var _title: String              // only value NEEDED when creating this DecisionOption
  var title: String {
    return _title
  }
  
  private var _details: String?       // add this to onboarding or just enter afterwards?
  var details: String? {
    return _details
  }
  
  private var _criteria = [Criterion]()   // entered via onboarding of this DecisionOption
  var criteria: [Criterion] {
    return _criteria
  }
  
  private var _value: Double?                // validate value when entering
  var value: Double? {
    return _value
  }
  
  private var _address: String?           // validate address when entering
  var address: String? {
    return _address
  }
  
  private var _imgURL: String?
  var imgURL: String? {
    return _imgURL
  }
  
  init(title: String, criteria: [Criterion]) {
    self._title = title
    self._criteria = criteria
  }
  
  init(title: String) {
    self._title = title
  }
  
  func returnAverageRating() -> Float {
    var sum: Float = 0
    for criterion in _criteria {
      sum = sum + criterion.returnWeightedRating()!
    }
    return sum
  }
  
  func returnRatingPct() -> Float {
    return self.returnAverageRating()/5.0
  }
  
  func setCriteria(with criteria: [Criterion]) {
    self._criteria = criteria
  }
  
  func setDefaultWeights() {               // do this once all criterion are selected, sets them all balanced
    for (index, _) in _criteria.enumerate() {
      _criteria[index].setWeight(to: 1.0/Float(_criteria.count))
    }
  }
  
  func setValue(to value: Double) {
    self._value = value
  }
  
  func setAddress(to address: String) {
    self._address = address
  }
  
  func setDetails(to details: String) {
    self._details = details
  }
  
  func setImage(url url: String) {
    self._imgURL = url
  }
  
}
