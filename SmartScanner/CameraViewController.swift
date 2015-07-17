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

	override func viewDidLoad() {
		super.viewDidLoad()

		var fastQR = KIFastQRCaptureView(frame: self.view.subviews[0].frame)
		fastQR.startCaptureWithDelegate(self)
		self.view.addSubview(fastQR)
		self.view.bringSubviewToFront(fastQR)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	//デリゲートメソッド。
	//- (void)fastQRView:(UIView *)fastQRView captureOutput:(NSString *)obtainedString;
	func fastQRView(fastQRView: UIView!, captureOutput obtainedString: String!) -> Void {
		NSLog("%@", obtainedString);
		(fastQRView as! KIFastQRCaptureView).stopCapture()
	}
}

