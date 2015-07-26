//
//  JumperViewController.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/21.
//  Copyright (c) 2015年 2-B.jp. All rights reserved.
//

import UIKit
import CoreData

class JumperViewController: UITableViewController {
	var scanedData: String = ""

	@IBOutlet weak var ScanedDataCell: UILabel!
	@IBOutlet weak var ConditionCell1: UITableViewCell!
	@IBOutlet weak var ConditionCell2: UITableViewCell!
	@IBOutlet weak var ConditionCellAmazonCat: UITableViewCell!
	@IBOutlet weak var AutoJumpCell: UITableViewCell!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.ScanedDataCell.text = self.scanedData
		NSLog("JumperViewController.viewDidLoad")
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void
	{
		NSLog("Cell[%@] selected", indexPath.row)
	}

	/*
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
	// セルの内容はNSArray型の「items」にセットされているものとする
		return items.count
	}
	*/

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}