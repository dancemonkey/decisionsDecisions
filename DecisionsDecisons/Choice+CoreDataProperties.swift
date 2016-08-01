//
//  Choice+CoreDataProperties.swift
//  DecisionsDecisons
//
//  Created by Drew Lanning on 7/31/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Choice {

    @NSManaged var address: String?
    @NSManaged var details: String?
    @NSManaged var title: String?
    @NSManaged var value: NSNumber?
    @NSManaged var criteria: NSSet?
    @NSManaged var decision: Decision?
    @NSManaged var image: NSData?

}
