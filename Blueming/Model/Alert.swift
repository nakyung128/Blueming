//
//  Alert.swift
//  Blueming
//
//  Created by 이나경 on 10/16/23.
//

import Foundation

struct Alert: Codable {
    let date: String
    let title: String
    let script: String
    var isRead: Bool
    let vc: String
}

extension Alert {
    static var data = [
        Alert(date: "2023-10-10", title: "오늘의 키워드가 아직 완성되지 않았어요!", script: "오늘의 키워드를 완성하면 맞춤형 아티클을 제공받을 수 있어요.", isRead: true, vc: "TabBarVC"),
        Alert(date: "2023-10-15", title: "오늘의 키워드가 아직 완성되지 않았어요!2", script: "오늘의 키워드를 완성하면 맞춤형 아티클을 제공받을 수 있어요.", isRead: true, vc: "TabBarVC"),
        Alert(date: "2023-10-15", title: "오늘의 키워드를 완성했어요!", script: "오늘의 키워드를 반영한 맞춤형 아티클을 확인해 보세요!", isRead: false, vc: "TabBarVC"),
        Alert(date: "2023-10-16", title: "오늘의 키워드가 아직 완성되지 않았어요!", script: "오늘의 키워드를 반영한 맞춤형 아티클을 확인해 보세요!", isRead: false, vc: "TabBarVC"),
        Alert(date: "2023-10-16", title: "오늘은 자가진단을 하는 날이에요:)", script: "일주일간 나의 변화를 살펴봐요!", isRead: false, vc: "TestVC"),
        Alert(date: "2023-10-17", title: "오늘의 키워드가 아직 완성되지 않았어요!", script: "오늘의 키워드를 완성하면 맞춤형 아티클을 제공받을 수 있어요.", isRead: false, vc: "TabBarVC"),
        Alert(date: "2023-10-17", title: "오늘의 키워드가 아직 완성되지 않았어요!2", script: "오늘의 키워드를 완성하면 맞춤형 아티클을 제공받을 수 있어요.", isRead: false, vc: "TabBarVC")
    ]
}

extension UserDefaults {
    func setAlerts(_ alerts: [Alert], forKey key: String) {
        let encoder = JSONEncoder()
        if let encodedAlerts = try? encoder.encode(alerts) {
            set(encodedAlerts, forKey: key)
        }
    }
    
    func alerts(forKey key: String) -> [Alert]? {
        guard let savedAlerts = value(forKey: key) as? Data else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode([Alert].self, from: savedAlerts)
    }
}
