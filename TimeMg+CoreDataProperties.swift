//
//  TimeMg+CoreDataProperties.swift
//  commitCommit
//
//  Created by togashi yoshiki on 2017/08/14.
//  Copyright © 2017年 Yoshiki Togashi. All rights reserved.
//

import Foundation
import CoreData


extension TimeMg {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeMg> {
        return NSFetchRequest<TimeMg>(entityName: "TimeMg")
    }

    @NSManaged public var nowTime: NSDate?
    @NSManaged public var tagetTime: Double

}
