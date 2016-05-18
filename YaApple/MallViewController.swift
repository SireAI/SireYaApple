//
//  MallViewController.swift
//  YaApple
//
//  Created by Sire on 16/4/20.
//  Copyright © 2016年 sire. All rights reserved.
//

import UIKit
import MJRefresh

class MallViewController: UIViewController, UITableViewSubDelegate {
	// - MARK: Properties
	@IBOutlet weak var mallTableView: UITableView! {
		didSet {
			MJRefreshSetting()
		}
	}
	private let mallModel = MallModel()
	private var mallAdapter: SireTableViewAdapter<MallInfor>? {
		didSet {
			mallAdapter?.tabViewSubDelegate = self
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		mallModel.delegate = self
		mallModel.fetchMallDataFrom(source: DataSource.MemoryCache)
		self.mallTableView.mj_header.beginRefreshing()
//		mallTableView.estimatedRowHeight = 200

	}
	private func updateUI(data: MallInfor?) {
		if self.mallAdapter == nil {
			self.mallAdapter = SireTableViewAdapter<MallInfor>(tableView: mallTableView, cellConditions: [BannerTableViewCell()])
		}

		mallAdapter!.setDataSource(data)
	}

	func scrollViewDidScroll(scrollView: UIScrollView) {
		let rollY = scrollView.contentOffset.y
		let alpha = max(0, min(rollY / 200, 1.0))
		(self.navigationController as? MallNavigationController)?.changeNavigationBarAlpha(alpha)
	}

	// - MARK: message event client

	override func onEvent(event: SireMessageEvent) {
		switch event {
		case is NoCache:
			break
		case is MallInfor:
			endUpRefresh()
			updateUI(event as? MallInfor)
		default:
			break
		}
	}

	// - MARK: MJRefresh
	func MJRefreshSetting() {
		// up refresh
		self.mallTableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(onRefresh))
		// down more
		self.mallTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(onLoadMore))
	}
	func onRefresh() {
		self.mallModel.fetchMallDataFrom(source: DataSource.NetWorking)
	}
	func onLoadMore() {
	}
	private func endUpRefresh() {
		self.mallTableView.mj_header.endRefreshing()
	}
	private func endLoadMore() {
		self.mallTableView.mj_footer.endRefreshing()
	}

}

