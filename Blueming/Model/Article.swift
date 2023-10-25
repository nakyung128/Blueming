import Foundation

struct Article: Codable {
    let img: String!
    let title: String!
    let script: String!
    let link: String!
}

extension Article {
    static var allData = depressed + sad + unrest + stress + confusion + body + family + baby + ect
    
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
    
    static var body = [
        Article(img: "body", title: "출산 후 달라진 나의 몸?!", script: "흔히 여자의 몸은 임신과 출산을 겪기 전후로 나뉜\n다고 해요 ...", link: "https://www.babybilly.app/posts/57"),
        Article(img: "body1", title: "분만 후 6주 동안의 산욕기 관리", script: "여성은 생애주기 동안 남성보다 많은 신체 변화를\n겪습니다.", link: "http://www.healtip.co.kr/news/articleView.html?idxno=3465"),
        Article(img: "body2", title: "아이를 낳고 머리가 나빠졌어요", script: "일부 여성분들은 기억력이 전보다 나빠지는 시기\n를 임신 혹은 출산 후 시기로 기억하시는 경우가 ...", link: "https://mindhub.kr/blog/2004"),
        Article(img: "body3", title: "참을 수 없는 간지러움, 임산부\n소양증 대처법!", script: "임신을 하고나서부터 팔, 다리, 배, 허벅지 등의 ...", link: "http://www.healthumer.com/news/articleView.html?idxno=7561"),
        Article(img: "body4", title: "출산 후 허리관리,\n평생 척추 좌우한다", script: "임신, 출산은 여자에서 엄마로 새로 태어나는 ...", link: "https://terms.naver.com/entry.naver?docId=3353368&cid=63166&categoryId=56745"),
        Article(img: "body5", title: "임신 중 우울증은 '이 질환' 발병\n확률을 높인다!", script: "모두가 축복하는 임신. 그러나, 임산부 입장에서 ...", link: "https://www.stcarollo.or.kr/0401/2454"),
        Article(img: "body6", title: "산후후유증은 치료해야 할 질병", script: "출산의 기쁨도 잠시 산모는 아기 돌보기에 정신 없\n는나날을 보내게 됩니다.", link: "https://www.chamc.co.kr/health/e_clinic/content.asp?cc_id=11505&co_id=841&ct_id=115"),
        Article(img: "body7", title: "출산 후 변하는 신체,\n산후관리가 중요한 이유는?", script: "임신과 출산은 생명 탄생이라는 아름다운 과정이 ...", link: "https://www.medicalworldnews.co.kr/m/view.php?idx=1510950243"),
        Article(img: "body8", title: "산후 건강관리, 출산 전보다 더 건강\n한 몸 찾으려면?", script: "출산은 여성의 삶에 있어서 매우 중대한 비중을 ... ", link: "https://www.pharmnews.com/news/articleView.html?idxno=220845"),
        Article(img: "body9", title: "출산후 6개월이내 2명중 1명 질병", script: "우리나라 산모들은 출산후 건강관리가 매우 취약한 것으로 나타나 산후질병에 대한 적극적인 ...", link: "https://www.khanews.com/news/articleView.html?idxno=23972"),
        Article(img: "body10", title: "간호사가 알려 주는 홈케어", script: "산후조리, 혹은 산후관리라 하며 소위 사욕기 동안\n에 일어나는 모든 현상에 대한 종합적인 처치를 ....", link: "http://www.khna.or.kr/homecare_new/10_pregn/birth04.php"),
        Article(img: "body11", title: "정확히 알아야 할 출산 직후 몸 관리", script: "아기를 낳은 엄마의 몸이 임신전의 상태로 되돌아가는 6주 정도의 시기를 '산욕기'라고 부르고...", link: "https://post.naver.com/viewer/postView.nhn?memberNo=1967484&volumeNo=13023224"),
        Article(img: "body12", title: "산욕기에 지켜야 할 주의사항은?", script: "산욕기는 출산 후 산모의 몸이 다시 임신 이전의 상\n태로 회복하는 기간으로, 골반 내 장기 기능이 ...", link: "https://www.omdi.co.kr/introduce/column/read.jsp?reqPageNo=1&no=212"),
        Article(img: "body13", title: "출산 후 산후조리법", script: "출산 후 기간별 산후조리법에 대해 알아봅시다.", link: "https://www.maeili.com/cms/contents/contentsView.do?idx=1172&categoryCd1=2&categoryCd2=2&categoryCd3=0&reCome=1&gubn=1"),
        Article(img: "body14", title: "온몸 쑤시고 시린 ‘산후풍’\n피하는 방법", script: "흔히 산후조리를 잘못해서 생긴다는 '산후풍'은 ...", link: "https://www.lottefoodmall.com/?act=pasteuri.pasteuri_list_view&pas_code=delivery&cate_code=04&pas_div=1&pas_seq=656&ch="),
        Article(img: "body15", title: "아기가 백일의 기적을 맞이할 때\n엄마의 몸은?", script: "흔히들 '백일의 기적'이라고 하죠? 갓 태어난 아기 ...", link: "https://brunch.co.kr/@srsynn/105"),
        Article(img: "body16", title: "산후조리원 꼭 가야하나요?", script: "\"2주에 몇백만 원이라던데 산후조리원에 꼭 가야\n하나요?\"", link: "https://brunch.co.kr/@the148/114"),
        Article(img: "body17", title: "출산 후 다이어트 언제 시작해야\n할까?", script: "누워서 떡 먹는 출산 후 '첫 번째 다이어트 황금 ...", link: "https://brunch.co.kr/@srsynn/104"),
        Article(img: "body18", title: "여름에 출산한 산모를 위한 산후조리\n법", script: "산후조리, 여름에도 내복 입고 땀 빼야 한다?", link: "https://brunch.co.kr/@healtip/1596"),
        Article(img: "body19", title: "질염의 증상과 종류, 치료까지!", script: "여성 질환 중 감기처럼 흔하고 자주 걸리는 것은?\n제목에서 유추하셨겠지만 바로 ...", link: "https://brunch.co.kr/@forhappywomen/202")
    ]
    
    static var family = [
        Article(img: "family", title: "가족에 대하여", script: "활기 넘치고 복작거리는 집, 모두가 있는 그 곳으로\n돌아가고 싶은 마음이 들 때가 있다.", link: "https://brunch.co.kr/@thebooks/122"),
        Article(img: "family1", title: "행복한 가족의 7가지 비밀", script: "많은 사람들이 행복한 가족의 조건으로 돈을 꼽는\n다. 하지만 화목한 가정을 유지하기 위해", link: "https://www.ibabynews.com/news/articleView.html?idxno=14802"),
        Article(img: "family2", title: "건강한 가정은 어떤 특징이 있을까?", script: "건강한 가정은 부부의 친밀도에 따라 결정된다고\n해도 과언이 아니다.", link: "http://www.enewstoday.kr/news/articleView.html?idxno=1560"),
        Article(img: "family3", title: "대물림되는 가족 정서의 힘", script: "5월은 가족의 달로 많은 분들이 가족들과의 함께하\n는 시간들을 보내게 됩니다.", link: "https://mindhub.kr/blog/33441"),
        Article(img: "family4", title: "바람직한 가정을 위한 구체적 방법", script: "가정은 모든 사람들에게 휴식과 재충전을 위한 곳\n이다. 가정은 사람의 삶에 기본적인 영향을 미친다.", link: "https://brunch.co.kr/@chass3/33"),
        Article(img: "family5", title: "산후 우울증에 대처하는 남편의 자세", script: "출산하는 여성 중 최소 50~70%까지 산후 우울감\n을 경험합니다.", link: "http://www.psychiatricnews.net/news/articleView.html?idxno=18780"),
        Article(img: "family6", title: "출산 후 찾아올 수 있는 결혼 생활과 삶의 위기 ", script: "자녀의 탄생은 기쁜 일이다. 하지만 아이를 갖는 ...", link: "https://www.bbc.com/korean/features-66074006.amp"),
        Article(img: "family7", title: "임산부·영유아 동반자·노약자가 편리\n한 가족배려주차장 조성", script: "서울시가 날로 심각해지는 저출생 위기와 ...", link: "https://news.seoul.go.kr/traffic/archives/509863"),
        Article(img: "family8", title: "화목한 가족관계를 위한 핵심 전략", script: "파트너십(partnership, 흔히 파트너십으로 오기)\n은 비즈니스 파트너 또는 동업자들이 상호 이익 ...", link: "https://kwonhyuckjune.tistory.com/entry/%ED%99%94%EB%AA%A9%ED%95%9C-%EA%B0%80%EC%A1%B1%EA%B4%80%EA%B3%84%EB%A5%BC-%EC%9C%84%ED%95%9C-%ED%95%B5%EC%8B%AC-%EC%A0%84%EB%9E%B5"),
        Article(img: "family9", title: "화목한 가족은 당연하지 않다", script: "어른이 되면, 대부분의 사람들이 저마다의 가족문\n제를 안고있다는 것을 알게 됩니다.", link: "https://brunch.co.kr/@kundera/187"),
        Article(img: "family10", title: "이상적인 가정을 이뤄가기 위해 필요한 노력", script: "몇 년 전에, 현대 가정의 한 형태를 설명하는 ...", link: "https://brunch.co.kr/@d7dd0a484350480/35"),
        Article(img: "family11", title: "심리전문가를 남편으로 둔 아내의\n산후우울증 극복기", script: "2019년 코로나가 창궐하고 우리는 모두 ...", link: "https://brunch.co.kr/@mentalconsultin/73"),
        Article(img: "family12", title: "산후우울증과 현명한 남편의 역할", script: "산후우울증의 원인은 아직 명확히 밝혀지진 않았\n지만 우울증의 한 형태로 분류되며, 출산 후 ...", link: "https://omgrich.tistory.com/entry/%EC%82%B0%ED%9B%84%EC%9A%B0%EC%9A%B8%EC%A6%9D%EA%B3%BC-%ED%98%84%EB%AA%85%ED%95%9C-%EB%82%A8%ED%8E%B8%EC%9D%98-%EC%97%AD%ED%95%A0"),
        Article(img: "family13", title: "자녀를 가진다는 것의 의미", script: "얼마 전 둘째 아이가 태어났다. 실은 담담한 이 한\n문장에는 결코 다 담아지지 않을 인생의 큰 변화다.", link: "https://brunch.co.kr/@isakkim/53"),
        Article(img: "family14", title: "애는 내가 낳았는데 산후 우울증은\n남편에게 왔다", script: "예상대로였다. 출산 후 유방암 치료와 육아를 ...", link: "https://brunch.co.kr/@de3a1e7211f7414/37"),
        Article(img: "family15", title: "최선의 육아, 가족이 서로 사랑하며\n화목하는 것", script: "로스쿨에서 '가족법'을 배울 때의 기억이 있다.", link: "https://brunch.co.kr/@zeropoint/104"),
        Article(img: "family16", title: "둘째가 고민이라면?", script: "사회적으로 초혼 나이가 늦어지면서 한 자녀 가족\n이 많은 때지만, 둘째를 고려한다면 반드시 ...", link: "https://www.babybilly.app/posts/854"),
        Article(img: "family17", title: "화목한 가정을 만드는 육아 비밀", script: "오랜만에 만난 친구의 집을 방문하게 되었습니다.\n밝은 부부의 모습과 예의바른 아이들의 모습이 ...", link: "https://mymywoo.com/entry/%ED%99%94%EB%AA%A9%ED%95%9C-%EA%B0%80%EC%A0%95%EC%9D%84-%EB%A7%8C%EB%93%9C%EB%8A%94-%EB%B9%84%EB%B0%80")
    ]

    static var baby = [
        Article(img: "baby", title: "만 2세 ~ 2세 반, 어둠을 무서워하고\n악몽을 꿀 때", script: "아이들이 밤중에 두려움을 느끼는 시기가 올 수 ...", link: "https://ddoke.com/article/218044/"),
        Article(img: "baby1", title: "엄빠의 삶의 질 수직상승! 신박한 육\n아템은?", script: "넘쳐나는 육아템 속에서 보석 같은 육아템이 있 ...", link: "https://www.babybilly.app/posts/3338"),
        Article(img: "baby2", title: "출생 이후 3년은 꼭 엄마가 키워야 된\n다?", script: "태어나서 3년까지 아이를 엄마가 키우지 않으면 ...", link: "https://www.babybilly.app/posts/1426"),
        Article(img: "baby3", title: "양치질 전쟁! 어떻게 도와줘야 할까\n요?", script: "대부분의 아이들은 양치질을 싫어해요. 그래서 ...", link: "https://www.babybilly.app/posts/1257"),
        Article(img: "baby4", title: "아이 음식에 소금간은 언제부터 하는\n게 좋을까?", script: "간을 하면 아이들이 음식을 더 잘 먹는건 확실 ...", link: "https://www.babybilly.app/posts/3235"),
        Article(img: "baby5", title: "특명, 내 아이를 여러 사물로부터 보\n호하기", script: "한국소비자원의 조사에 따르면 아이들의 안전 ...", link: "http://www.healthumer.com/news/articleView.html?idxno=9068"),
        Article(img: "baby6", title: "자꾸만 게워내는 우리 아가, 괜찮은\n걸까?", script: "갓 태어난 아이들은 모든 장기들이 미숙하다고 ...", link: "http://www.healthumer.com/news/articleView.html?idxno=7936"),
        Article(img: "baby7", title: "내 아이의 기저귀를 허투루 보지 마\n라! 신생아 변 관찰하기", script: "어느 덧 출산한지 50일이 지났다. 그 사이 제법 ...", link: "http://www.healthumer.com/news/articleView.html?idxno=7641"),
        Article(img: "baby8", title: "우리 아이 낮잠에 대한 모든 것", script: "갑자기 추워진 날씨로 인해 집 안의 온도를 높인다\n고 보일러와 장판을 틀고 있으니 잠이 쏟아진다.", link: "http://www.healthumer.com/news/articleView.html?idxno=6295"),
        Article(img: "baby9", title: "육아 강박증, 엄마와 아이 모두에게\n‘독’", script: "엄마가 처음인 나는 아이를 완벽하게 키우고 싶다 ...", link: "http://www.healthumer.com/news/articleView.html?idxno=6187"),
        Article(img: "baby10", title: "오염되기 쉬운 장난감 세척, 관리법", script: "봉제 장난감은 자주 털고 햇볕을 쬐어준다_ 천이나\n털 소재의 봉제 장난감은 먼지와 집먼지 진드기가 ...", link: "https://www.lottefoodmall.com/?act=pasteuri.pasteuri_list_view&pas_code=play&cate_code=01&pas_div=2&pas_seq=725&ch="),
        Article(img: "baby11", title: "기저귀 떼기, 순서대로 차근차근", script: "‘언제 똥오줌 가리려나….’ 아이가 자라면서 부모들\n은 고심한다.", link: "https://www.lottefoodmall.com/?act=pasteuri.pasteuri_list_view&pas_code=play&cate_code=01&pas_div=2&pas_seq=559&ch="),
        Article(img: "baby12", title: "안아주면 '손 탄다' vs 안아줄수록 '좋\n다’", script: "아기가 보채거나 떼를 쓸 때 어른들은 ‘손 탄다’며 ...", link: "https://www.lottefoodmall.com/?act=pasteuri.pasteuri_list_view&pas_code=play&cate_code=01&pas_div=2&pas_seq=581&ch="),
        Article(img: "baby13", title: "소심하게 말해보는 육아 팁들", script: "아이를 키우다 보면 이럴 땐 어떻게 해야 되지? 라\n는 물음을 하루에도 수십 번 하게 된다.", link: "https://brunch.co.kr/@minkyung2525/31"),
        Article(img: "baby14", title: "정서 발달을 위한 부모의 역할", script: "흔히, 정서와 감정을 쉽게 혼용하여 사용하게 되는\n데, 정서는 감정에 비해 좀 더 분화된 상태를 의미 ...", link: "https://www.maeili.com/cms/contents/contentsView.do?idx=769&categoryCd1=4&categoryCd2=1&categoryCd3=5&reCome=1&gubn=1&pageIndex=8&condition=1"),
        Article(img: "baby15", title: "행복을 더하는 다둥이 양육 팁 5가지", script: "한 부모가 낳은 아이들이건만 다둥이들은 달라도 너무 다르다.\n충분한 사랑을 표현하고 싶지만 ...", link: "https://www.ibabynews.com/news/articleView.html?idxno=47741"),
        Article(img: "baby16", title: "우리 아이 기질에 따른 양육 방법", script: "모든 아이들은 자신만의 독특한 기질을 가지고 태\n어납니다.", link: "https://blog.naver.com/mogefkorea/221583811905"),
        Article(img: "baby17", title: "\"좋은부모-잘 자라는 아이\" 를 위한\n양육팁 10가지", script: "\"좋은부모-잘 자라는 아이\"를 위한 양육팁을 ...", link: "http://xn--jk1bm3k8ycn7evra240aocy12h.kr/bbs/board.php?bo_table=notice&wr_id=14&page=10&page=10"),
        Article(img: "baby18", title: "자녀 양육을 위한 소소한 레시피", script: "세 아이 엄마 '박민경 선생님'이 알려주는 소소한 육\n아꿀팁!", link: "https://mandeok.life/%EC%9D%B8%EB%AC%B8%ED%95%99-%EA%B0%95%EC%A2%8C-2/?mod=document&uid=43")
    ]
    
    static var ect = [
        Article(img: "ect", title: "산후 조리에 대해 꼭 알아야 할 8가지", script: "처음으로 엄마가 되었거나 최근에 출산했다면 이\n미 아기와 출산 과정에 대해 임신 중 많이 배웠을지", link: "https://youaremom.co.kr/pregnancy/%EC%B6%9C%EC%82%B0/%EC%82%B0%ED%9B%84-%EB%AA%B8%EC%A1%B0%EB%A6%AC/post-partum-management/"),
        Article(img: "ect1", title: "어린 나이에 유독 ‘산후우울증’\n잘 생기는 이유", script: "최근 MBN 예능프로그램 '고딩엄빠'에 출연했던 ...", link: "https://health.chosun.com/site/data/html_dir/2022/04/18/2022041801335.html"),
        Article(img: "ect2", title: "출산 전에는 몰랐지만 출산 후에는\n폭풍 공감하는 5가지", script: "임신 중에는 출산 후 일상을 상상하는 것만으로 ...", link: "https://m.post.naver.com/viewer/postView.naver?volumeNo=32536138&memberNo=3265970&navigationType=push"),
        Article(img: "ect3", title: "서울대병원, '산후우울증' 산후우울감\n과 증상과 치료 차이 크다", script: "82년생 김지영 '산후우울증', 대부분 겪는 산후 ...", link: "https://bktimes.net/detail.php?number=74606&thread=21r10r02"),
        Article(img: "ect4", title: "임산부 보건소 및 각종 혜택 총정리", script: "임산부 보건소 및 각종 임신 혜택을 모르고 계셔서\n받지 못하셨거나, 늦게 방문해 혜택을 놓치고 ...", link: "https://kwonhyuckjune.tistory.com/entry/%EC%9E%84%EC%82%B0%EB%B6%80-%EB%B3%B4%EA%B1%B4%EC%86%8C-%EB%B0%8F-%EA%B0%81%EC%A2%85-%ED%98%9C%ED%83%9D-%EC%B4%9D%EC%A0%95%EB%A6%AC"),
        Article(img: "ect5", title: "출산 후 아빠가 해야 할 일", script: "의외로 출산 후 엄마아빠는 정신없는 시간을 보내\n기 때문에 미리 준비하지 않으면", link: "https://www.babybilly.app/posts/3597")
    ]

}
