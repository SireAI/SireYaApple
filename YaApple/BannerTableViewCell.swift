//
//  BannerTableViewCell.swift
//  YaApple
//
//  Created by Sire on 16/4/26.
//  Copyright © 2016年 sire. All rights reserved.
//

import UIKit

class BannerTableViewCell: SameItemCell {
    
    @IBOutlet weak var containerView: UIView!
	private var images = ["loading_Page1", "loading_Page2", "loading_Page3", "loading_Page4", "loading_Page5"]
    override func layoutSubviews() {
        let rollView = loadXib("\(RollBannerView.self)") as! RollBannerView
        rollView.addToView(self.containerView)
        rollView.startRollWithData(images)
    }
}
