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
        Keyword(img: "감정기복", keyword: "감정기복"),
        Keyword(img: "두려움", keyword: "두려움"),
        Keyword(img: "무기력", keyword: "무기력"),
        Keyword(img: "불안초조", keyword: "불안/초조"),
        Keyword(img: "스트레스", keyword: "스트레스"),
        Keyword(img: "슬픔", keyword: "슬픔"),
        Keyword(img: "죄책감", keyword: "죄책감"),
        Keyword(img: "예민짜증", keyword: "예민/짜증"),
        Keyword(img: "우울", keyword: "우울"),
        Keyword(img: "절망감", keyword: "절망감"),
        Keyword(img: "혼란", keyword: "혼란"),
        Keyword(img: "분노", keyword: "분노")
    ]
    
    static var health = [
        Keyword(img: "건망증", keyword: "건망증"),
        Keyword(img: "두통", keyword: "두통/어지럼증"),
        Keyword(img: "위장장애", keyword: "위장장애"),
        Keyword(img: "메스꺼움", keyword: "메스꺼움"),
        Keyword(img: "관절통", keyword: "관절통"),
        Keyword(img: "피로", keyword: "피로"),
        Keyword(img: "부종", keyword: "부종"),
        Keyword(img: "배변장애", keyword: "배변 장애"),
        Keyword(img: "수면장애", keyword: "수면 장애"),
        Keyword(img: "식욕변화", keyword: "식욕 변화"),
        Keyword(img: "외상", keyword: "외상"),
        Keyword(img: "요통", keyword: "요통"),
        Keyword(img: "젖몸살", keyword: "젖몸살"),
        Keyword(img: "질분비물", keyword: "질분비물"),
        Keyword(img: "탈모", keyword: "탈모"),
        Keyword(img: "복통", keyword: "복통"),
        Keyword(img: "피부질환", keyword: "피부질환"),
        Keyword(img: "훗배앓이", keyword: "훗배앓이")
    ]
}
