//
//  CameraViewController.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/13.
//  Copyright (c) 2015年 2-B.jp. All rights reserved.
//

import UIKit
import KIFastQR
import CoreData

class CameraViewController: UIViewController, KIFastQRCaptureDelegate {
	@IBOutlet weak var dataView: UITextView!
	@IBOutlet weak var placeholderView: UIView!

	@IBOutlet weak var testButton: UIButton!
	var scanedData: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.bringSubviewToFront(dataView)
		self.view.bringSubviewToFront(placeholderView)
		placeholderView.backgroundColor = UIColor.grayColor()

		self.dataView.text = ""

		for (index, view) in enumerate(self.view.subviews) {
			NSLog("subviews[%d]%@", index, NSStringFromClass(view.dynamicType) ?? "(null type)");
		}
		for (index, view) in enumerate(placeholderView.subviews) {
			NSLog("placeholderView.subviews[%d]%@", index, NSStringFromClass(view.dynamicType) ?? "(null type)");
		}

		var fastQR = KIFastQRCaptureView(frame: placeholderView.frame)
		fastQR.backgroundColor = UIColor.blueColor()
		fastQR.startCaptureWithDelegate(self)
		self.view.addSubview(fastQR)
		placeholderView.bringSubviewToFront(fastQR)
		placeholderView.bringSubviewToFront(placeholderView.subviews[0] as! UIView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	//デリゲートメソッド。
	//- (void)fastQRView:(UIView *)fastQRView captureOutput:(NSString *)obtainedString;
	func fastQRView(fastQRView: UIView!, captureOutput obtainedString: String!) -> Void {
		NSLog("%@", obtainedString)
		self.dataView.text = self.dataView.text + "\nRESULT: " + obtainedString
		(fastQRView as! KIFastQRCaptureView).stopCapture()

		self.scanedData = obtainedString

		NSLog("performSegueWithIdentifier(CameraToJumperSegue)")
		performSegueWithIdentifier("Cam2JumperSegue", sender: nil)
	}

	@IBAction func test(sender: AnyObject) {
		let obtainedString = "(org.gs1.EAN-13)9784904855317"
		NSLog("%@", obtainedString)
		self.dataView.text = self.dataView.text + "\nTEST RESULT: " + obtainedString

		self.scanedData = obtainedString

		NSLog("performSegueWithIdentifier(CameraToJumperSegue)")
		performSegueWithIdentifier("Cam2JumperSegue", sender: nil)
	}

	/*
	* 画面遷移
	*/
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
		let jumperViewController: JumperViewController = segue.destinationViewController as! JumperViewController
		jumperViewController.scanedData = self.scanedData
	}
}

