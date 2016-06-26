//
//  Decision.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/22/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation

struct Decision {
  
  var title: String
  var mappable: Bool = false
  var includePhoto: Bool = false
  var choices: [Choice]
  
  init(title: String, choices: [Choice]) {
    self.title = title
    self.choices = choices
  }
  
  init(title: String, mappable: Bool, includePhoto: Bool, choices: [Choice]) {
    self.title = title
    self.choices = choices
    self.mappable = mappable
    self.includePhoto = includePhoto
  }
  
}