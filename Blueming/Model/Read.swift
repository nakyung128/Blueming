//
//  Read.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/09.
//

import Foundation

struct Read {
    let img: String!
    let title: String!
    let script: String!
}

extension Read {
    static var data = [
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐1", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐2", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐3", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐4", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐5", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐")
    ]
    
    static var depressed = [
        Read(img: "article_img.png", title: "우울을 잠재우기 위한 마음가짐1", script: "우울을 잠재우기 위한 마음가짐 우울을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "우울을 잠재우기 위한 마음가짐2", script: "우울을 잠재우기 위한 마음가짐 우울을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "우울을 잠재우기 위한 마음가짐3", script: "우울을 잠재우기 위한 마음가짐 우울을 잠재우기 위한 마음가짐")
    ]
    
    static var unrest = [
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐1", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐2", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐3", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐")
    ]
    
    static var sad = [
        Read(img: "article_img.png", title: "슬픔을 잠재우기 위한 마음가짐1", script: "슬픔을 잠재우기 위한 마음가짐 슬픔을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "슬픔을 잠재우기 위한 마음가짐2", script: "슬픔을 잠재우기 위한 마음가짐 슬픔을 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "슬픔을 잠재우기 위한 마음가짐3", script: "슬픔을 잠재우기 위한 마음가짐 슬픔을 잠재우기 위한 마음가짐")
    ]
    
    static var stress = [
        Read(img: "article_img.png", title: "스트레스를 잠재우기 위한 마음가짐1", script: "스트레스를 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "스트레스를 잠재우기 위한 마음가짐2", script: "스트레스를 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "스트레스를 잠재우기 위한 마음가짐3", script: "스트레스를 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐")
    ]
    
    static var confusion = [
        Read(img: "article_img.png", title: "혼란을 잠재우기 위한 마음가짐1", script: "혼란을 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "혼란을 잠재우기 위한 마음가짐2", script: "혼란을 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐"),
        Read(img: "article_img.png", title: "혼란을 잠재우기 위한 마음가짐3", script: "혼란을 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐")
    ]
    
    static var body1 = [
        Read(img: "article_img.png", title: "운동을 합시다1", script: "운동을 합시다 운동을 합시다 운동을 합시다"),
        Read(img: "article_img.png", title: "으쌰으쌰 파이팅1", script: "운동을 합시다 운동을 합시다 운동을 합시다"),
        Read(img: "article_img.png", title: "으쌰으쌰 파이팅1", script: "운동을 합시다 운동을 합시다 운동을 합시다")
    ]
    
    static var body2 = [
        Read(img: "article_img.png", title: "운동을 합시다2", script: "운동을 합시다 운동을 합시다 운동을 합시다"),
        Read(img: "article_img.png", title: "으쌰으쌰 파이팅2", script: "운동을 합시다 운동을 합시다 운동을 합시다")
    ]
    
    static var body3 = [
        Read(img: "article_img.png", title: "운동을 합시다3", script: "운동을 합시다 운동을 합시다 운동을 합시다"),
        Read(img: "article_img.png", title: "으쌰으쌰 파이팅3", script: "운동을 합시다 운동을 합시다 운동을 합시다")
    ]
    
    static var baby1 = [
        Read(img: "article_img.png", title: "여섯 번째 여름", script: "영원을 말했죠 꿈이 아니기를 혼돈 속을 지나면 반짝일 거라고"),
        Read(img: "article_img.png", title: "기다릴게", script: "기다릴게 너의 그곳에 내가 닿을 수 있게")
    ]
    static var baby2 = [
        Read(img: "article_img.png", title: "플레이브 많은 관심", script: "남예준 한노아 채밤비 도은호 유하민"),
        Read(img: "article_img.png", title: "부탁드립니다", script: "플레이브 영 원 하 자 으아아악")
    ]
    
    static var family1 = [
        Read(img: "article_img.png", title: "다이아몬드 시티 라이츠", script: "진조우파이아파이보와이파타이가타이가타타타타이가"),
        Read(img: "article_img.png", title: "니지산지로 가족 간 대화를 해 보아요", script: "챠페아페카라키나챠페아페카라키나묘호츄스케와이파")
    ]
    
    static var family2 = [
        Read(img: "article_img.png", title: "니지산지는 다단계입니다", script: "니지산지는 다단계입니다 니지산지는 다단계입니다 니지산지는 다단계입니다"),
        Read(img: "article_img.png", title: "물론 저는 안 합니다", script: "나는 니지산지 안 함 플레이브 하세요")
    ]
    
    static var ect1 = [
        Read(img: "article_img.png", title: "기타 글 제목1", script: "여기는 설명입니다 대충 설명이요"),
        Read(img: "article_img.png", title: "기타 글 제목2", script: "여기는 설명입니다 대충 설명이요")
    ]
    
    static var ect2 = [
        Read(img: "article_img.png", title: "기타 글 제목3", script: "여기는 설명입니다 대충 설명이요"),
        Read(img: "article_img.png", title: "기타 글 제목4", script: "여기는 설명입니다 대충 설명이요")
    ]
    
    static var ect3 = [
        Read(img: "article_img.png", title: "기타 글 제목5", script: "여기는 설명입니다 대충 설명이요"),
        Read(img: "article_img.png", title: "기타 글 제목6", script: "여기는 설명입니다 대충 설명이요")
    ]
}
