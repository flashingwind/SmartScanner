//
//  History.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/28.
//  Copyright (c) 2015 2-B.jp. All rights reserved.
//

import Foundation
import CoreData

class History: NSManagedObject {

    @NSManaged var scannedData: String
    @NSManaged var update: NSDate

}
