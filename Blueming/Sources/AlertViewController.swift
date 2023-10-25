import UIKit

class AlertViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var allAlerts: [Alert] = []
    var alertsToday: [Alert] = []
    var alertsYesterday: [Alert] = []
    var alertsLastWeek: [Alert] = []
    
    func filterAlertsByDate() {
        for alert in allAlerts {
            if let date = alert.dateObject {
                if date.isToday {
                    alertsToday.append(alert)
                } else if date.isYesterday {
                    alertsYesterday.append(alert)
                } else if date.isInLastWeek {
                    alertsLastWeek.append(alert)
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white // 원하는 배경색으로 설정하십시오.
        
        let headerLabel = UILabel()
        headerLabel.attributedText = NSMutableAttributedString(string: ["오늘", "어제", "최근 7일"][section], attributes: [NSAttributedString.Key.kern: -0.6, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.Text03!])
        
        headerView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20), // 왼쪽 여백 설정
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16), // 오른쪽 여백 설정
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30 // 원하는 높이로 설정하십시오.
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "오늘"
        case 1: return "어제"
        case 2: return "최근 7일"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return alertsToday.count
        case 1: return alertsYesterday.count
        case 2: return alertsLastWeek.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alertView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as! AlertCell
        let target: Alert
        
        switch indexPath.section {
        case 0: target = alertsToday[indexPath.row]
        case 1: target = alertsYesterday[indexPath.row]
        case 2: target = alertsLastWeek[indexPath.row]
        default: fatalError("Unknown section")
        }
        
        cell.title.text = target.title
        cell.script.text = target.script
        
        if target.isRead {
            cell.cellImg.image = UIImage(named: "readCell")
            cell.lineImg.image = UIImage(named: "readLine")
            cell.title.textColor = UIColor.white
            cell.script.textColor = UIColor.white
        }
        
        cell.selectionStyle = .none
        
        // 자간 설정
        cell.configureCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 아이템 가져오기
        if let cell = alertView.cellForRow(at: indexPath) as? AlertCell {
            // 선택 후 디자인으로 변경
            cell.cellImg.image = UIImage(named: "readCell")
            cell.lineImg.image = UIImage(named: "readLine")
            cell.title.textColor = UIColor.white
            cell.script.textColor = UIColor.white
            
            var selectedAlert: Alert
            
            switch indexPath.section {
            case 0: selectedAlert = alertsToday[indexPath.row]
            case 1: selectedAlert = alertsYesterday[indexPath.row]
            case 2: selectedAlert = alertsLastWeek[indexPath.row]
            default: fatalError("Unknown section")
            }
            
            if let index = allAlerts.firstIndex(where: { $0.date == selectedAlert.date && $0.title == selectedAlert.title }) {
                allAlerts[index].isRead = true
            }
            
            switch selectedAlert.vc {
            case "TestVC":
                if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as? UITabBarController {
                    tabBarController.selectedIndex = 3
                    tabBarController.modalPresentationStyle = .fullScreen
                    tabBarController.modalTransitionStyle = .crossDissolve
                    self.present(tabBarController, animated: true, completion: nil)
                }
            case "checkVC":
                if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as? UITabBarController {
                    tabBarController.selectedIndex = 2
                    tabBarController.modalPresentationStyle = .fullScreen
                    tabBarController.modalTransitionStyle = .crossDissolve
                    self.present(tabBarController, animated: true, completion: nil)
                }

            default:
                if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as? UITabBarController {
                    tabBarController.selectedIndex = 0
                    tabBarController.modalPresentationStyle = .fullScreen
                    tabBarController.modalTransitionStyle = .crossDissolve
                    self.present(tabBarController, animated: true, completion: nil)
                }
            }
            
            UserDefaults.standard.setAlerts(allAlerts, forKey: "alertsDataKey")
        }
    }
    
    @IBOutlet var backBtn: UIImageView!
    @IBOutlet var alertView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertView.dataSource = self
        alertView.delegate = self
        
        alertView.backgroundColor = UIColor.white
        
        let nibName = UINib(nibName: "AlertCell", bundle: nil)
        alertView.register(nibName, forCellReuseIdentifier: "alertCell")
        
        allAlerts = UserDefaults.standard.alerts(forKey: "alertsDataKey") ?? []
        filterAlertsByDate()
        
        // 이전 화면
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(back))
        backBtn.isUserInteractionEnabled = true
        backBtn.addGestureRecognizer(tapGesture)
    }
    
    // 이전 화면으로 이동
    @objc func back(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension Date {
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var isInLastWeek: Bool {
        let startOfToday = Calendar.current.startOfDay(for: Date())
        guard let endOfYesterday = Calendar.current.date(byAdding: .second, value: -1, to: startOfToday),
              let startOfOneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: endOfYesterday) else { return false }
        
        return self > startOfOneWeekAgo && self < endOfYesterday
    }
}

extension Alert {
    var dateObject: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self.date)
    }
}
