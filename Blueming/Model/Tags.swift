//
//  Tags.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/14.
//

import Foundation

struct Tags {
    let category: String
    let tagName: String
}

extension Tags {
    static var emotion = [
        Tags(category: "감정", tagName: "우울"),
        Tags(category: "감정", tagName: "불안/초조"),
        Tags(category: "감정", tagName: "슬픔"),
        Tags(category: "감정", tagName: "혼란"),
        Tags(category: "감정", tagName: "스트레스")
    ]
    static var body = [
        Tags(category: "건강", tagName: "건강 1"),
        Tags(category: "건강", tagName: "건강 2"),
        Tags(category: "건강", tagName: "건강 3")
    ]
    static var baby = [
        Tags(category: "육아", tagName: "육아 1"),
        Tags(category: "육아", tagName: "육아 2")
    ]
    static var family = [
        Tags(category: "가족", tagName: "가족 1"),
        Tags(category: "가족", tagName: "가족 2")
    ]
    static var etc = [
        Tags(category: "기타", tagName: "기타 1"),
        Tags(category: "기타", tagName: "기타 2"),
        Tags(category: "기타", tagName: "기타 3")
    ]
}
