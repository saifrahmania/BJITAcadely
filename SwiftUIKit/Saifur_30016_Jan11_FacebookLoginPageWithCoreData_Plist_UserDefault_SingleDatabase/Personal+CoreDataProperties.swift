//
//  Personal+CoreDataProperties.swift
//  FacebookLoginPage
//
//  Created by BJIT on 6/1/23.
//
//

import Foundation
import CoreData


extension Personal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Personal> {
        return NSFetchRequest<Personal>(entityName: "Personal")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension Personal : Identifiable {

}
