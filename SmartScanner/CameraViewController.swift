//
//  CameraViewController.swift
//  SmartScanner
//
//  Created by munenori on 2015/07/13.
//  Copyright (c) 2015年 2-B.jp. All rights reserved.
//

import UIKit
import KIFastQR

class CameraViewController: UIViewController, KIFastQRCaptureDelegate {
	@IBOutlet weak var dataView: UITextView!

	override func viewDidLoad() {
		super.viewDidLoad()

		var fastQR = KIFastQRCaptureView(frame: self.view.subviews[0].frame)
		fastQR.startCaptureWithDelegate(self)
		self.view.addSubview(fastQR)
		self.view.bringSubviewToFront(fastQR)
		self.view.bringSubviewToFront(dataView)

		self.dataView.text = ""
		for t in AVCaptureMetadataOutput().availableMetadataObjectTypes {
			self.dataView.text = self.dataView.text + "\n" + t.name
		}
		if AVCaptureMetadataOutput().availableMetadataObjectTypes.count == 0 {
			self.dataView.text = self.dataView.text + "\n(none)"
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	//デリゲートメソッド。
	//- (void)fastQRView:(UIView *)fastQRView captureOutput:(NSString *)obtainedString;
	func fastQRView(fastQRView: UIView!, captureOutput obtainedString: String!) -> Void {
		NSLog("%@", obtainedString);
		self.dataView.text = self.dataView.text + "\nRESULT: " + obtainedString
		(fastQRView as! KIFastQRCaptureView).stopCapture()
	}
}

