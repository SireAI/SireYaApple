//
//	MallInfor.swift
import Foundation
import EVReflection

class MallInfor: SireMessageEvent, ServerMsgInfor {
	func getResCode() -> Int {
		return Code
	}
	func getMSG() -> String {
		return Msg ?? EmptyMessage
	}
	var Code: Int = InvalidCode
	var ExceptionMsg: String?
	var Msg: String?
	var RequestId: String?
	var Result: ResultEntity?

}

extension MallInfor: DataCount {
	var count: Int {
		return 4
	}
}
class ResultEntity: Store {
	var Ads: [AdsEntity]?
	var Entrances4: [Entrances4Entity]?
	var FocusMaps: [FocusMapsEntity]?
	var SeckillInfo: SeckillInfoEntity?

}

class SeckillInfoEntity: Store {
	var NumberOfPeople: Int = 0
	var SeckillCountdown: Int = 0
	var SeckillDesc: String?
	var SeckillDescImageUrl: String?
	var SeckillEndTime: String?
	var SeckillList: [SeckillListEntity]?
	var SeckillName: String?
	var TargetAction: AnyObject?
}

class SeckillListEntity: Store {
	var BrandCountryLogo: String?
	var BuyNumber: Int = 0
	var CountryName: String?
	var DisCount: Int = 0
	var Features: String?
	var ImageNameFull: String?
	var InStock: Bool = false
	var ItemCode: String?
	var MarketPrice: String?
	var Name: String?
	var PromotionDescription: String?
	var PromotionPrice: String?
	var ShortName: String?
	var TargetAction: TargetActionEntity?
}

class TargetActionEntity: Store {
	var Param: String?
	var Type: Int = 0
}
class AdsEntity: Store {
	var AdList: [AdListEntity]?
	var DynamicAdType: Int = 0
	var TargetAction: TargetActionEntity?
	var Title: String?
}

class AdListEntity: Store {
	var BeginTime: String?
	var DescriptionField: String?
	var EndTime: String?
	var ImageUrl: String?
	var LinkBlockName: String?
	// var Products: [AnyObject]?
	var SubTitle: String?
	var TargetAction: TargetActionEntity?
	var Title: String?
}
class FocusMapsEntity: Store {
	var BeginTime: String?
	var DescriptionField: String?
	var EndTime: String?
	var ImageUrl: String?
	var Path: String?
	var SubTitle: String?
	var TargetAction: TargetActionEntity?
	var Title: String?
}

class Entrances4Entity: Store {
	var BeginTime: String?
	var DescriptionField: String?
	var EndTime: String?
	var ImageUrl: String?
	var Path: String?
	var SubTitle: String?
	var TargetAction: TargetActionEntity?
	var Title: String?
}
