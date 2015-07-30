//
//  JumpCondition.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/28.
//  Copyright (c) 2015 2-B.jp. All rights reserved.
//

import Foundation
import CoreData

class JumpCondition: NSManagedObject {

    @NSManaged var amazonCat: String
    @NSManaged var codeType: String
    @NSManaged var condID: NSNumber
    @NSManaged var includesEmail: NSNumber
    @NSManaged var includesNumber: NSNumber
    @NSManaged var includesOtherString: NSNumber
    @NSManaged var includesString: NSNumber
    @NSManaged var includesURL: NSNumber
    @NSManaged var isAvailable: NSNumber
    @NSManaged var numberOfDigits: NSNumber
    @NSManaged var priority: NSNumber
    @NSManaged var update: NSDate

}
