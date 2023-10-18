//
//  Keyword.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/27.
//

import Foundation

struct Keyword {
    let img: String?
    let keyword: String
}

extension Keyword {
    static var recommend = [
        Keyword(img: nil, keyword: "👩‍🍼 육아"),
        Keyword(img: nil, keyword: "🎈아이와 함께"),
        Keyword(img: nil, keyword: "🏖️ 휴식"),
        Keyword(img: nil, keyword: "😊 안정")
    ]
    
    static var famous1 = [
        Keyword(img: nil, keyword: "우울"),
        Keyword(img: nil, keyword: "분노 조절"),
        Keyword(img: nil, keyword: "짜증"),
        Keyword(img: nil, keyword: "스트레스")
    ]
    
    static var famous2 = [
        Keyword(img: nil, keyword: "예민/짜증"),
        Keyword(img: nil, keyword: "분노"),
        Keyword(img: nil, keyword: "수면 장애"),
        Keyword(img: nil, keyword: "피로"),
        Keyword(img: nil, keyword: "술")
    ]
    
    static var emotion = [
        Keyword(img: "emotion_example", keyword: "감정기복"),
        Keyword(img: "emotion_example", keyword: "두려움"),
        Keyword(img: "emotion_example", keyword: "무기력"),
        Keyword(img: "emotion_example", keyword: "불안/초조"),
        Keyword(img: "emotion_example", keyword: "스트레스"),
        Keyword(img: "emotion_example", keyword: "슬픔"),
        Keyword(img: "emotion_example", keyword: "죄책감"),
        Keyword(img: "emotion_example", keyword: "예민/짜증"),
        Keyword(img: "emotion_example", keyword: "우울"),
        Keyword(img: "emotion_example", keyword: "절망감"),
        Keyword(img: "emotion_example", keyword: "혼란"),
        Keyword(img: "emotion_example", keyword: "분노")
    ]
    
    static var health = [
        Keyword(img: "emotion_example", keyword: "건망증"),
        Keyword(img: "emotion_example", keyword: "두통/어지럼증"),
        Keyword(img: "emotion_example", keyword: "위장장애"),
        Keyword(img: "emotion_example", keyword: "메스꺼움"),
        Keyword(img: "emotion_example", keyword: "관절통"),
        Keyword(img: "emotion_example", keyword: "피로"),
        Keyword(img: "emotion_example", keyword: "부종"),
        Keyword(img: "emotion_example", keyword: "배변 장애"),
        Keyword(img: "emotion_example", keyword: "수면 장애"),
        Keyword(img: "emotion_example", keyword: "식욕 변화"),
        Keyword(img: "emotion_example", keyword: "외상"),
        Keyword(img: "emotion_example", keyword: "요통"),
        Keyword(img: "emotion_example", keyword: "젖몸살"),
        Keyword(img: "emotion_example", keyword: "질분비물"),
        Keyword(img: "emotion_example", keyword: "탈모"),
        Keyword(img: "emotion_example", keyword: "복통"),
        Keyword(img: "emotion_example", keyword: "피부질환"),
        Keyword(img: "emotion_example", keyword: "훗배앓이")
    ]
}
