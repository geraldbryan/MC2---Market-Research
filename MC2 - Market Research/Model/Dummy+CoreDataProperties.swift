//
//  Dummy+CoreDataProperties.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 23/06/22.
//
//

import Foundation
import CoreData


extension Dummy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dummy> {
        return NSFetchRequest<Dummy>(entityName: "Dummy")
    }

    @NSManaged public var count: String?

}

extension Dummy : Identifiable {

}
