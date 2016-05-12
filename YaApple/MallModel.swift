//
//  MallModel.swift
//  YaApple
//  ////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| ^_^ |)                              //
//                         O\  =  /O                              //
//                      ____/`---'\____                           //
//                    .'  \\|     |//  `.                         //
//                   /  \\|||  :  |||//  \                        //
//                  /  _||||| -:- |||||-  \                       //
//                  |   | \\\  -  /// |   |                       //
//                  | \_|  ''\---/''  |   |                       //
//                  \  .-\__  `-`  ___/-. /                       //
//                ___`. .'  /--.--\  `. . ___                     //
//              ."" '<  `.___\_<|>_/___.'  >'"".                  //
//            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
//            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
//      ========`-.____`-.___\_____/___.-`____.-'========         //
//                           `=---='                              //
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
//         佛祖保佑            永无BUG              永不修改         //
////////////////////////////////////////////////////////////////////
//  Created by Sire on 16/4/22.
//  Copyright © 2016年 sire. All rights reserved.
//

import Foundation
enum DataSource {
	case MemoryCache
	case NetWorking
}

class MallModel: SireModel {
	// - MARK: Mall data
	func fetchMallDataFrom(source source: DataSource) {
		switch source {
		case .NetWorking:
			fetchMallDataFromNet()
		case .MemoryCache:
			fetchMallDataFromCache()
		}
	}
	private func fetchMallDataFromNet() {
		let mallNetApi = getBasicGetNetApiWith(path: "/ad/v5", params: [:])
		fetchDataWith(netApi: mallNetApi, eventType: MallInfor.self)
	}
	private func fetchMallDataFromCache() {
		var messageEvent: SireMessageEvent?
		if let cacheData = MemoryCache.sharedInstance.fetchDataFromMemory(MallInfor.self) {
			messageEvent = cacheData
		} else {
			messageEvent = NoCache()
		}
		postToDelegate(messageEvent)
	}

	// - MARK: Life Cycle

	override func beforeNetDataArrival<T : SireMessageEvent>(reformerData: T?) -> T? {
		if T.self == MallInfor.self {
			// use cache data
			if reformerData == nil {
				let cacheData = MemoryCache.sharedInstance.fetchDataFromMemory(MallInfor.self)
				return cacheData as? T
			} else {
				MemoryCache.sharedInstance.memoryAdd("\(MallInfor.self)", object: reformerData)
			}
		}
		return reformerData
	}
}