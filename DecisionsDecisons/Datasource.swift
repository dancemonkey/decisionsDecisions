//
//  Datasource.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 6/25/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import Foundation
import CoreData

class Datasource {
  
  static let ds = Datasource()
  
  var decisions = [Decision]()
  
  func fetchDecisions() {
    let fetchRequest = NSFetchRequest(entityName: "Decision")
    let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    do {
      let results = try appDel.managedObjectContext.executeFetchRequest(fetchRequest)
      if let decisions = results as? [Decision] {
        self.decisions = decisions
      }
    } catch {
      print("\(error)")
    }
  }
  
  // UNTESTED
  func fetchChoices(forDecision decision: Decision) -> [Choice]? {
    self.fetchDecisions()
    for dec in self.decisions {
      if dec == decision {
        let choices = Array(arrayLiteral: dec.choices!) as? [Choice]
        return choices
      }
    }
    return nil
  }

}