//
//  ResearchResult+CoreDataProperties.swift
//  MC2 - Market Research
//
//  Created by Gerald Bryan on 22/06/22.
//
//

import Foundation
import CoreData


extension ResearchResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ResearchResult> {
        return NSFetchRequest<ResearchResult>(entityName: "ResearchResult")
    }

    @NSManaged public var finished: Bool
    @NSManaged public var id: String?
    @NSManaged public var result: String?
    @NSManaged public var type: String?

}

extension ResearchResult : Identifiable {

}
