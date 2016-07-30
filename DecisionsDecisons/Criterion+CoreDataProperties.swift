//
//  Criterion+CoreDataProperties.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/30/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Criterion {

    @NSManaged var rating: NSNumber?
    @NSManaged var title: String?
    @NSManaged var weight: NSNumber?
    @NSManaged var choice: Choice?
    @NSManaged var decision: Decision?

}
