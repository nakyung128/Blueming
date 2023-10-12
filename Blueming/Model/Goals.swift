//
//  Goals.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/11.
//

import Foundation

struct Goals {
    let date: String
    let img: String
    let title: String
    let script: String
    let first: Bool
    let second: Bool
    let third: Bool
}

extension Goals {
    static var data = [
        Goals(date: "2023-10-11", img: "check_sample.png", title: "식사 세 번 챙기기", script: "바쁘고 지치는 하루여도\n끼니 챙기기는 필수예요!", first: true, second: false, third: false),
        Goals(date: "2023-10-11", img: "check_sample.png", title: "나를 위한 격려해 주기", script: "나를 위한 따뜻한 격려를 해 보세요!\n충분히 잘하고 있으니까요.", first: true, second: false, third: false),
        Goals(date: "2023-10-12", img: "check_sample.png", title: "따뜻한 차 세 잔 마시기", script: "지친 몸을 녹여 줄\n따끈한 티타임을 가져 보아요!", first: true, second: true, third: false),
        Goals(date: "2023-10-12", img: "check_sample.png", title: "목표입니다3", script: "이건 목표의\n설명입니다3", first: false, second: false, third: false),
        Goals(date: "2023-10-10", img: "check_sample.png", title: "목표입니다4", script: "이건 목표의\n설명입니다4", first: true, second: true, third: true),
        Goals(date: "2023-10-10", img: "check_sample.png", title: "목표입니다5", script: "이건 목표의\n설명입니다5", first: true, second: true, third: true)
    ]
}
