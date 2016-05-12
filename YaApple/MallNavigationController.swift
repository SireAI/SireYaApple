//
//  MallNavigationController.swift
//  YaApple
//
//  Created by Sire on 16/4/27.
//  Copyright © 2016年 sire. All rights reserved.
//

import UIKit
import SnapKit

class MallNavigationController: UINavigationController, UINavigationControllerDelegate {
	private var alphaView: UIView!
	private var currentAlpaha: CGFloat = 0
	override func viewDidLoad() {
		super.viewDidLoad()
		setNavigationBarBackgroundView()
	}

	private func setNavigationBarBackgroundView() {
		self.alphaView = UIView()
		self.alphaView.backgroundColor = UIColor(red: 0.17, green: 0.54, blue: 0.17, alpha: 1)
		self.view.insertSubview(alphaView, belowSubview: navigationBar)
		alphaView.snp_makeConstraints { (make) in
			make.leading.equalTo(0)
			make.trailing.equalTo(0)
			make.top.equalTo(0)
			make.height.equalTo(navigationBar.bounds.height + 20)
		}
		let image = UIImage.createImageWithColor(UIColor.clearColor())
		self.navigationBar.setBackgroundImage(image, forBarMetrics: UIBarMetrics.Compact)
		self.navigationBar.layer.masksToBounds = true
	}
//    func viewWillAppear(animated: Bool) {
//        changeNavigationBarAlpha(currentAlpaha)
//    }

	func changeNavigationBarAlpha(alpha: CGFloat) {
		self.alphaView.backgroundColor = self.alphaView.backgroundColor?.colorWithAlphaComponent(alpha)
		self.currentAlpaha = alpha
	}
//
//    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
//        			changeNavigationBarAlpha(1)
//    }
}
