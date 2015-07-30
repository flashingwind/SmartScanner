//
//  ConditionView.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/27.
//  Copyright (c) 2015 2-B.jp. All rights reserved.
//

import UIKit
import CoreData

class ConditionViewController: UITableViewController {
	var items: [String] = []
	var selectedIndex: Int?

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void
	{
		NSLog("Cell[%@] selected", indexPath.row)
	}

	/*
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
	return items.count
	}
	*/

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}