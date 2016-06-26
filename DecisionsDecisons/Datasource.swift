//
//  Datasource.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/25/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation

class Datasource {
  
  static let ds = Datasource()
  
  // test data for main screen collectionVC
  var decisions = [Decision(title: "Decision One", choices: [Choice(title: "Option One"), Choice(title: "Option Two"), Choice(title: "Option Three")]), Decision(title: "Decision Two", choices: [Choice(title: "Option One"), Choice(title: "Option Two"), Choice(title: "Option Three"), Choice(title: "Option Four")]), Decision(title: "Decision Three", choices: [Choice(title: "Option One"), Choice(title: "Option Two")])]
  
  func addNew(decision decision: Decision) {
    self.decisions.append(decision)
  }
  
}