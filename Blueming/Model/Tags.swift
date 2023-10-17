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
        Tags(category: "감정", tagName: "감정기복"),
        Tags(category: "감정", tagName: "혼란"),
        Tags(category: "감정", tagName: "분노")
    ]
}
