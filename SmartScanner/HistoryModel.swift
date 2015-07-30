//
//  HistoryModel.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/28.
//  Copyright (c) 2015年 2-B.jp. All rights reserved.
//

import UIKit
import CoreData

class HistoryModel {

	let entity: NSEntityDescription
	let managedObjectContext: NSManagedObjectContext

	var items: [History] = []

	init() {
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

		self.managedObjectContext = appDelegate.managedObjectContext!
		entity = NSEntityDescription.entityForName("History", inManagedObjectContext: self.managedObjectContext)!

		let managedObjectContext = appDelegate.managedObjectContext
		let con = appDelegate.managedObjectContext!


		if let hs = readAllData() {
			self.items = hs
		}
	}

	func readAllData() -> [History]? {

		// フェッチ
		let fetchRequest = NSFetchRequest()
		fetchRequest.entity = entity
		fetchRequest.predicate = NSPredicate(format: "")

		var error: NSError? = nil
		if var results = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) {
			for obj in results {
				let model = obj as! SmartScanner.History
				println("scannedData: \(model.scannedData), update: \(model.update)");
			}
			if let ms = results as? [History] {
				self.items = ms
				return ms
			}
		}
		return nil
	}

	func insertData() -> Void {
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		if let con = appDelegate.managedObjectContext {
			// Historyエンティティに新しいオブジェクトを追加、取得
			// 第一引数はエンティティ名、第二引数はManagedObjectContext
			let managedObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("History", inManagedObjectContext: con)
			// データを設定
			if let model = managedObject as? SmartScanner.History {
				model.scannedData = "hogehoge"
				model.update = NSDate()
			}
		}
	}
}