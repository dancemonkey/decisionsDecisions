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
  let decisions = [Decision(title: "Decision One", options: [DecisionOption(title: "Option One"), DecisionOption(title: "Option Two"), DecisionOption(title: "Option Three")]), Decision(title: "Decision Two", options: [DecisionOption(title: "Option One"), DecisionOption(title: "Option Two"), DecisionOption(title: "Option Three"), DecisionOption(title: "Option Four")]), Decision(title: "Decision Three", options: [DecisionOption(title: "Option One"), DecisionOption(title: "Option Two")])]
  
}