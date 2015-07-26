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

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
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
		return 1
	}



	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {

		let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! UITableViewCell

		return cell
	}



/*
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void
	{
		NSLog("Cell[%@] selected", indexPath.row)
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		var cell = tableView.dequeueReusableCellWithIdentifier("HistoryItemCell") as! UITableViewCell

		cell.textLabel!.text = String(indexPath.row)

		return cell
	}
*/
}

