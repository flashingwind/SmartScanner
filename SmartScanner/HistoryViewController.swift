//
//  HistoryViewController.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/13.
//  Copyright (c) 2015年 2-B.jp. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

	var historySet: HistoryModel = HistoryModel()

	override func viewDidLoad() {
		super.viewDidLoad()

		//self.historySet = HistoryModel()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// functions needed to be implemented
	// for table view

	// セクション数
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	// セクションごとの行数
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return historySet.items.count
	}


	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void
	{
		NSLog("Cell[%@] selected", indexPath.row)
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		var cell = tableView.dequeueReusableCellWithIdentifier("HistoryItemCell") as! UITableViewCell

		cell.textLabel!.text = "[\(indexPath.row)]\(self.historySet.items[indexPath.row])"

		return cell
	}



}

