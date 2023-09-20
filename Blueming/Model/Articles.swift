//
//  Articles.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/20.
//

import Foundation

struct Articles {
    let img: String!
    let title: String!
    let script: String!
}

extension Articles {
    static var depressed = [
        Articles(img: "article_img.png", title: "우울1", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Articles(img: "article_img.png", title: "우울2", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Articles(img: "article_img.png", title: "우울3", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Articles(img: "article_img.png", title: "우울4", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐")
    ]
}
