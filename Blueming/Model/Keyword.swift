//
//  Keyword.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/27.
//

import Foundation

struct Keyword {
    let keyword: String
}

extension Keyword {
    static var recommend = [
        Keyword(keyword: "👩‍🍼 육아"),
        Keyword(keyword: "🎈아이와 함께"),
        Keyword(keyword: "🏖️ 휴식"),
        Keyword(keyword: "😊 안정")
    ]
    
    static var famous1 = [
        Keyword(keyword: "우울"),
        Keyword(keyword: "분노 조절"),
        Keyword(keyword: "짜증"),
        Keyword(keyword: "스트레스")
    ]
    
    static var famous2 = [
        Keyword(keyword: "예민/짜증"),
        Keyword(keyword: "분노"),
        Keyword(keyword: "수면 장애"),
        Keyword(keyword: "피로"),
        Keyword(keyword: "술")
    ]
}
