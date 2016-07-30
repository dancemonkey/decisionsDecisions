//
//  Decision+CoreDataProperties.swift
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

extension Decision {

    @NSManaged var includePhoto: NSNumber?
    @NSManaged var mappable: NSNumber?
    @NSManaged var title: String?
    @NSManaged var baseCriteria: NSSet?
    @NSManaged var choices: NSSet?

}
