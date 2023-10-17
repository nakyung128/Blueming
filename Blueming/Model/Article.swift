//
//  Article.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/09.
//

import Foundation

struct Article {
    let img: String!
    let title: String!
    let script: String!
    let link: String!
}

extension Article {
    static var allData = [
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐1", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐2", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐3", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "우울을 잠재우기 위한 마음가짐1", script: "우울을 잠재우기 위한 마음가짐 우울을 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "슬픔을 잠재우기 위한 마음가짐1", script: "슬픔을 잠재우기 위한 마음가짐 슬픔을 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "슬픔을 잠재우기 위한 마음가짐2", script: "슬픔을 잠재우기 위한 마음가짐 슬픔을 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "스트레스를 잠재우기 위한 마음가짐1", script: "스트레스를 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "스트레스를 잠재우기 위한 마음가짐2", script: "스트레스를 잠재우기 위한 마음가짐 스트레스를 잠재우기 위한 마음가짐", link: ""),
        Article(img: "article_img.png", title: "운동을 합시다1", script: "운동을 합시다 운동을 합시다 운동을 합시다", link: ""),
        Article(img: "article_img.png", title: "으쌰으쌰 파이팅1", script: "운동을 합시다 운동을 합시다 운동을 합시다", link: ""),
        Article(img: "article_img.png", title: "플레이브 많은 관심", script: "남예준 한노아 채밤비 도은호 유하민" ,link: "")
    ]
    static var data = [
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐1", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐",link: ""),
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐2", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐",link: ""),
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐3", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐",link: ""),
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐4", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐",link: ""),
        Article(img: "article_img.png", title: "불안함을 잠재우기 위한 마음가짐5", script: "불안함을 잠재우기 위한 마음가짐 불안함을 잠재우기 위한 마음가짐",link: "")
    ]
    
    // 우울
    static var depressed = [
        Article(img: "depressed1", title: "산후우울증이란", script: "산후 우울증이란 넓은 의미에서 분만 후 산모들이\n겪는 감정적인 우울함 등 일련의 증상이 ...", link: "https://m.terms.naver.com/entry.naver?docId=2098784&cid=51028&categoryId=51028"),
        Article(img: "depressed2", title: "신생아 엄마의 SOS, 산후 우울증", script: "출산 후 좀처럼 회복되지 않는 몸으로 아이 돌보랴,\n몸조리 하느라 하루 24시간도 모자란 초보 맘...", link: "https://ilsan.m.chamc.co.kr:452/health/columnView.cha?menuCode=2531&&idx=21"),
        Article(img: "depressed3", title: "산후우울증을 극복 어떻게?", script: "​엄마가 된다는 것은 정말 경이로운 기적이라고\n할 수 있습니다.", link: "https://www.on-maum.com/%EC%82%B0%ED%9B%84%EC%9A%B0%EC%9A%B8%EC%A6%9D%EC%9D%84-%EA%B7%B9%EB%B3%B5%ED%95%98%EB%A0%A4%EB%A9%B4-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%B4%EC%95%BC-%ED%95%A0%EA%B9%8C%EC%9A%94/"),
        Article(img: "depressed4", title: "산후우울증 극복 방법", script: "육아스트레스와 산욕기 우울증을 슬기롭게\n극복하는 길은 엄마에게 부담이 되는 육아를 ...", link: "https://www.maeili.com/cms/contents/contentsView.do?idx=5085&categoryCd1=2&categoryCd2=2&categoryCd3=0&reCome=1&gubn=1&pageIndex=1&condition=1"),
        Article(img: "depressed5", title: "산후우울증 방치, '산후정신증' 온다", script: "전체 산모의 0.1%는 아기를 해치거나 스스로\n목숨을 끊는 위험성까지 드러낸다.", link: "http://www.monews.co.kr/news/articleView.html?idxno=104491"),
        Article(img: "depressed6", title: "산후 우울증은 산모의 탓이 아니다", script: "아이를 낳고 보니 동생이나 조카들을 예뻐하고\n돌보았던 것과는 달랐다.", link: "http://www.healthumer.com/news/articleView.html?idxno=8701"),
        Article(img: "depressed7", title: "임신과 우울증", script: "여성은 생애주기 동안 남성보다 많은 신체 변화를\n겪습니다. 월경‧임신‧폐경을 거치면서 ...", link: "http://www.healtip.co.kr/news/articleView.html?idxno=3366"),
        Article(img: "depressed8", title: "심리전문가를 남편으로 둔 아내의\n산후우울증 극복기", script: "2019년 코로나가 창궐하고 우리는 모두 ...", link: "https://brunch.co.kr/@mentalconsultin/73"),
        Article(img: "depressed9", title: "산후 우울증이 의심될 때 꼭 읽어\n보세요!", script: "아기가 어릴 때, 특히 3~6개월 정도 되었을 ...", link: "https://www.babybilly.app/posts/3658"),
        Article(img: "depressed10", title: "함께 극복해요, 산후우울증", script: "출산 후 아기와 함께하는 생활이 마냥 행복할 줄\n알았는데 막상 내게 닥친 현실은 그렇지 않아요.", link: "https://www.babybilly.app/posts/149"),
        Article(img: "depressed11", title: "입덧도 힘든데, 우울증까지?\n‘산전  우울증’ 방치하면…", script: "신체 변화에 따른 극심한 불편함, 통증을 안고 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=31548874&memberNo=3265970&navigationType=push"),
        Article(img: "depressed12", title: "산후우울증으로 힘들어하는\n엄마들에게", script: "산후우울증은 산모의 약 10~20% 정도에서 ...", link: "https://post.naver.com/viewer/postView.naver?volumeNo=34070138&memberNo=1891127"),
        Article(img: "depressed13", title: "산후 우울증 극복하기", script: "산모의 10명 중 5명은 산후우울감을 겪습니다.\n출산 후 친정에서 한 달간 몸조리하고 ...", link: "https://brunch.co.kr/@happygrow/36"),
        Article(img: "depressed14", title: "“나는 엄마다” 산후우울증 극복하기", script: "생각보다 힘든 육아스트레스로 우울증을 호소하는\n산모들이 늘어나는 추세다.", link: "https://m.segye.com/view/20131017003944")
    ]
    
    // 불안/초조
    static var unrest = [
        Article(img: "unrest1", title: "“아기 낳기 무서워요!” 분만공포증\n어떻게 극복하지?", script: "살면서 한 번도 직접 경험해보지 못한 출산을 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=32709472&memberNo=3265970&navigationType=push"),
        Article(img: "unrest2", title: "임신부 잠 못들게 만드는\n‘하지불안증후군’", script: "그렇지 않아도 잠자리가 불편해 수면에 방해를 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=32020708&memberNo=3265970&navigationType=push"),
        Article(img: "unrest3", title: "임신 초기맘 괴롭히는 별별 불편\n증상들!", script: "입덧만큼 괴롭진 않아도 주기적으로 반복돼 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=30897726&memberNo=3265970&navigationType=push"),
        Article(img: "unrest4", title: "불안장애의 원인 증상 & 이겨내는법", script: "불안장애의 원인은 세가지로 나눠볼 수가\n있습니다.", link: "https://kyk9812048.tistory.com/652"),
        Article(img: "unrest5", title: "당신만 모르는 불안을 잠재우는\n확실한 방법", script: "막연한 불안감을 느낄 때가 있다. 어떠한 ...", link: "https://brunch.co.kr/@bookmir90/140"),
        Article(img: "unrest6", title: "정신과 의사가 알려주는 불안감\n극복 팁 2가지", script: "우리가 살아가는 한, 불안과 걱정 없이 늘 ...", link: "https://v.daum.net/v/5fc8868b8a07124b9443406d"),
        Article(img: "unrest7", title: "오늘도 불안감에 잠 못 이루는\n당신에게", script: "불안감은 많은 경우 불면증으로 이어지기도 한다.", link: "https://sensio.tistory.com/392")
    ]
    
    // 감정기복
    static var sad = [
        Article(img: "sad1", title: "임신 중 널뛰는 ‘감정기복’…\n이 정도라고요?", script: "임신 중 급변하는 호르몬으로 유발되는 다양한 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=30170268&memberNo=3265970"),
        Article(img: "sad2", title: "“아무것도 하기 싫다!” 산모들이\n말하는 임신 중 무기력증", script: "다양한 증상들이 하나둘 시작되면서 조금씩 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=33024839&memberNo=3265970&navigationType=push"),
        Article(img: "sad3", title: "감정기복을 다스리는 방법", script: "여러 가지 감정을 느끼는 것은 우리를 인간답게\n만드는 특별한 경험 중 중요한 부분을 차지한다.", link: "https://ko.wikihow.com/%EA%B0%90%EC%A0%95%EA%B8%B0%EB%B3%B5%EC%9D%84-%EB%8B%A4%EC%8A%A4%EB%A6%AC%EB%8A%94-%EB%B0%A9%EB%B2%95"),
        Article(img: "sad4", title: "감정 기복 심한 이유와 조절하는 법", script: "감정 기복이 심하다는 말, 혹시 들어보신 적\n있으신가요? 쉽게 기분이 좋아졌다가, 금방 ...", link: "https://goyou.goroletter.com/83"),
        Article(img: "sad5", title: "감정 기복이 심한 사람의 특징", script: "인생을 살면서 우리는 자주 감정의 기복을\n마주한다. 인간은 주변 사람과 관계를 맺지 않는 ...", link: "https://brunch.co.kr/@ssmile777/187"),
        Article(img: "sad6", title: "감정 기복 다스리는 6가지 방법", script: "여러 감정을 느끼는 것은 우리를 인간답게 만드는\n특별한 경험 중 중요한 부분을 차지합니다.", link: "https://yaegreena.tistory.com/226"),
        Article(img: "sad7", title: "임산부 감정기복 총정리", script: "임신 전에는 모든 일에 있어 태연하고 무덤덤했던\n제가, 이제는 까탈스러워지고 예민해지고 ...", link: "https://memoryseung1224.tistory.com/931")
    ]
    
    // 분노
    static var stress = [
        Article(img: "stress1", title: "화병의 뜻, 현명하게 화를 다스리는\n7가지 방법은?", script: "화병의 뜻은 화가 치밀어 오르는데 밖으로 ...", link: "https://www.joongang.co.kr/article/17360835"),
        Article(img: "stress2", title: "분노를 다스리는 5가지 방법", script: "우리는 상대방에게 무시를 당하거나 모욕을\n받았을 때 이를 참기 힘듭니다. 이러한 감정은 ...", link: "http://www.psychiatricnews.net/news/articleView.html?idxno=16128"),
        Article(img: "stress3", title: "이건 몰랐지? 화날 때 진정 시켜 주는\n음식들", script: "음식은 여러 가지 방법으로  화가 나는 상황 ...", link: "http://www.healthy-enews.com/news/articleView.html?idxno=1368"),
        Article(img: "stress4", title: "화나거나 슬플 땐 잠을 자야 한다?", script: "분노는 일종의 습관이다. 화를 내면 순식간에 뇌에\n피가 쏠린다. 혈류량은 무려 6초 만에 절정에 ..." , link: "https://scent.kisti.re.kr/site/main/archive/article/%ED%99%94%EB%82%98%EA%B1%B0%EB%82%98-%EC%8A%AC%ED%94%8C-%EB%95%90-%EC%9E%A0%EC%9D%84-%EC%9E%90%EC%95%BC-%ED%95%9C%EB%8B%A4"),
        Article(img: "stress5", title: "욱할때 화가날때 참는 방법", script: "인간의 분노의 무의식 감정은 생존과 연결되어\n있습니다." , link: "https://kyk9812048.tistory.com/648"),
        Article(img: "stress6", title: "화를 다스리는 법, 화날 때 다스리기", script: "화가 났을때 화를 표출할 수도 있고, 화를 속으로\n삭힐 수도 있을 겁니다.", link: "https://skyfoot.tistory.com/284"),
        Article(img: "stress7", title: "지혜롭게 화를 다스리는 법", script: "살다 보면 화가 날 때도 있고, 웃음이 날 때도 있고,\n눈물이 날 때도 있다.", link: "https://greenbsky.tistory.com/116"),
        Article(img: "stress8", title: "감정을 다스리는 호흡법", script: "어떠한 상처로 고통받을 때 우리는 상대를\n원망합니다.", link: "https://adipo.tistory.com/entry/%ED%99%94%EB%A5%BC-%EB%8B%A4%EC%8A%A4%EB%A6%AC%EB%8A%94-%EB%B2%95")
    ]
    
    // 혼란
    static var confusion = [
        Article(img: "confusion1", title: "정신이 혼란스럽고, 멍해졌을 때\n돌아오는 7가지 방법", script: "흐릿하고, 집중이 안되고, 명확하게 생각할 수 ...", link: "https://whiteyongki.tistory.com/entry/%EC%A0%95%EC%8B%A0%EC%9D%B4-%ED%98%BC%EB%9E%80%EC%8A%A4%EB%9F%BD%EA%B3%A0%EB%A9%8D%ED%95%B4%EC%A1%8C%EC%9D%84%EB%95%8C-%EB%8F%8C%EC%95%84%EC%98%A4%EB%8A%94-7%EA%B0%80%EC%A7%80-%EB%B0%A9%EB%B2%95"),
        Article(img: "confusion2", title: "마음을 다스리는 명언 (마음이 복잡할때\n좋은글귀)", script: "지금 현재 나의 문제는 내 탓이 아니라, 자꾸 ...", link: "https://kyk9812048.tistory.com/202"),
        Article(img: "confusion3", title: "“내가 왜 이러지?” 임신 중 심해지는\n건망증", script: "말하고 싶은 단어가 떠오르지 않아 '음...'  ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=30907775&memberNo=3265970&navigationType=push"),
        Article(img: "confusion4", title: "임신, 그 혼란과 슬픔에 관하여", script: "엄마에게 임신 소식을 전한 그다음 날이었다. 기쁨\n인지 놀라움인지 당혹감인지 혹은 그 모두인지 ...", link: "https://brunch.co.kr/@jufeel2/2"),
        Article(img: "confusion5", title: "소란한 마음을 잠재우는 좋은 방법", script: "소란한 마음은 시간을 와해시킨다. ‘소란하다’란\n말은 ‘시끄럽고 어수선하다’는 뜻이다.", link: "https://brunch.co.kr/@sterdam/2022"),
        Article(img: "confusion6", title: "엄마라는 혼란스러움", script: "우리네 삶은 구분 짓고 분절하기를 좋아한다. 뭉뚱\n그려져 있거나 중립적인 성질의 것들을 ...", link: "https://brunch.co.kr/@50e24d8c7a6f4d7/6")
    ]
    
    static var body1 = [
        Article(img: "article_img.png", title: "운동을 합시다1", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: ""),
        Article(img: "article_img.png", title: "으쌰으쌰 파이팅1", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: ""),
        Article(img: "article_img.png", title: "으쌰으쌰 파이팅1", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: "")
    ]
    
    static var body2 = [
        Article(img: "article_img.png", title: "운동을 합시다2", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: ""),
        Article(img: "article_img.png", title: "으쌰으쌰 파이팅2", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: "")
    ]
    
    static var body3 = [
        Article(img: "article_img.png", title: "운동을 합시다3", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: ""),
        Article(img: "article_img.png", title: "으쌰으쌰 파이팅3", script: "운동을 합시다 운동을 합시다 운동을 합시다",link: "")
    ]
    
    static var baby1 = [
        Article(img: "article_img.png", title: "여섯 번째 여름", script: "영원을 말했죠 꿈이 아니기를 혼돈 속을 지나면 반짝일 거라고",link: ""),
        Article(img: "article_img.png", title: "기다릴게", script: "기다릴게 너의 그곳에 내가 닿을 수 있게",link: "")
    ]
    static var baby2 = [
        Article(img: "article_img.png", title: "플레이브 많은 관심", script: "남예준 한노아 채밤비 도은호 유하민",link: ""),
        Article(img: "article_img.png", title: "부탁드립니다", script: "플레이브 영 원 하 자 으아아악",link: "")
    ]
    
    static var family1 = [
        Article(img: "article_img.png", title: "다이아몬드 시티 라이츠", script: "진조우파이아파이보와이파타이가타이가타타타타이가",link: ""),
        Article(img: "article_img.png", title: "니지산지로 가족 간 대화를 해 보아요", script: "챠페아페카라키나챠페아페카라키나묘호츄스케와이파",link: "")
    ]
    
    static var family2 = [
        Article(img: "article_img.png", title: "니지산지는 다단계입니다", script: "니지산지는 다단계입니다 니지산지는 다단계입니다 니지산지는 다단계입니다",link: ""),
        Article(img: "article_img.png", title: "물론 저는 안 합니다", script: "나는 니지산지 안 함 플레이브 하세요",link: "")
    ]
    
    static var ect1 = [
        Article(img: "article_img.png", title: "기타 글 제목1", script: "여기는 설명입니다 대충 설명이요",link: ""),
        Article(img: "article_img.png", title: "기타 글 제목2", script: "여기는 설명입니다 대충 설명이요",link: "")
    ]
    
    static var ect2 = [
        Article(img: "article_img.png", title: "기타 글 제목3", script: "여기는 설명입니다 대충 설명이요",link: ""),
        Article(img: "article_img.png", title: "기타 글 제목4", script: "여기는 설명입니다 대충 설명이요",link: "")
    ]
    
    static var ect3 = [
        Article(img: "article_img.png", title: "기타 글 제목5", script: "여기는 설명입니다 대충 설명이요",link: ""),
        Article(img: "article_img.png", title: "기타 글 제목6", script: "여기는 설명입니다 대충 설명이요",link: "")
    ]
}
