//
//  Research+CoreDataProperties.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 22/06/22.
//
//

import Foundation
import CoreData


extension Research {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Research> {
        return NSFetchRequest<Research>(entityName: "Research")
    }

    @NSManaged public var deadline: Date?
    @NSManaged public var name: String?
    @NSManaged public var objective: String?
    @NSManaged public var id: String?

}

extension Research : Identifiable {

}
