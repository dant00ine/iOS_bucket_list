//
//  Mission+CoreDataProperties.swift
//  bucketListV2
//
//  Created by Daniel Thompson on 10/22/16.
//  Copyright © 2016 Daniel Thompson. All rights reserved.
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission");
    }

    @NSManaged public var details: String?

}
