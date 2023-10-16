//
//  NoteViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/09.
//

import UIKit
import FSCalendar

class CheckViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CheckListCellDelegate {
    
    func didTapCheckButton(at indexPath: IndexPath, buttonName: String, newState: Bool) {
        
        switch buttonName {
        case "first":
            selectedGoals[indexPath.row].first = newState
        case "second":
            selectedGoals[indexPath.row].second = newState
        case "third":
            selectedGoals[indexPath.row].third = newState
        default:
            break
        }
        
        if let indexInAllGoals = allGoals.firstIndex(where: { $0.title == selectedGoals[indexPath.row].title }) {
            allGoals[indexInAllGoals] = selectedGoals[indexPath.row]
        }
        
        // 데이터 변경
        UserDefaults.standard.setGoals(allGoals, forKey: "goalsDataKey")
        calendar.reloadData()
    }
    
    
    var allGoals: [Goals] = []
    var selectedGoals: [Goals] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedGoals.count == 0 ? 1 : selectedGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "checkCell", for: indexPath) as! CheckListCell
        
        // 체크리스트 데이터가 없을 때
        if selectedGoals.isEmpty {
            cell.img.image = UIImage(named: "noCheckImg")
            cell.first.isHidden = true
            cell.second.isHidden = true
            cell.third.isHidden = true
        } 
        // 데이터가 있지만 1번만 완료하면 되는 경우
        else if selectedGoals[indexPath.row].second == nil {
            cell.first.isHidden = false
            cell.second.isHidden = true
            cell.third.isHidden = true
            cell.img.image = UIImage(named: selectedGoals[indexPath.row].img)
            cell.goalTitle.text = selectedGoals[indexPath.row].title
            cell.goalScript.text = selectedGoals[indexPath.row].script
            cell.first.isSelected = selectedGoals[indexPath.row].first
        } 
        // 데이터 있고, 3번 완료해야 하는 경우
        else {
            cell.first.isHidden = false
            cell.second.isHidden = false
            cell.third.isHidden = false
            cell.img.image = UIImage(named: selectedGoals[indexPath.row].img)
            cell.goalTitle.text = selectedGoals[indexPath.row].title
            cell.goalScript.text = selectedGoals[indexPath.row].script
            cell.first.isSelected = selectedGoals[indexPath.row].first
            cell.second.isSelected = selectedGoals[indexPath.row].second ?? false
            cell.third.isSelected = selectedGoals[indexPath.row].third ?? false
        }
        
        // 자간 설정
        cell.configureCell()
        cell.isChecked()
        
        cell.delegate = self // Delegate 설정
        cell.indexPath = indexPath // IndexPath 설정
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftInset = (collectionView.frame.width - 310) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? CheckListCell)?.indexPath = indexPath
    }
    
    
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var script: UILabel!
    @IBOutlet var listView: UICollectionView!
    
    func getNextWeek(date: Date) -> Date {
        return  Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: date)!
    }
    
    func getPreviousWeek(date: Date) -> Date {
        return  Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: date)!
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        self.calendar.setCurrentPage(getNextWeek(date: calendar.currentPage), animated: true)
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        self.calendar.setCurrentPage(getPreviousWeek(date: calendar.currentPage), animated: true)
    }
    
    private let headerDateFormatter: DateFormatter = {
        let headerDateFormatter = DateFormatter()
        headerDateFormatter.dateFormat = "YYYY년 MM월"
        headerDateFormatter.locale = Locale(identifier: "ko_kr")
        headerDateFormatter.timeZone = TimeZone(identifier: "KST")
        
        return headerDateFormatter
    }()
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 EEEE"
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(identifier: "KST")
        
        return dateFormatter
    }()
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        headerLabel.attributedText = NSMutableAttributedString(string: self.headerDateFormatter.string(from: calendar.currentPage), attributes: [NSAttributedString.Key.kern: -1.2, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 24)!])
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        configure(cell: cell, for: date)
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        configure(cell: cell, for: date)
    }
    
    func configure(cell: FSCalendarCell, for date: Date) {
        if Calendar.current.isDateInToday(date) {
            cell.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        } else {
            cell.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        }
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 선택을 해제한 날짜의 셀을 가져옵니다.
        if let cell = calendar.cell(for: date, at: monthPosition) {
            // 이 셀의 폰트 상태를 업데이트합니다.
            configure(cell: cell, for: date)
        }
    }
    
    
    
    // 날짜를 선택했을 때 호출되는 메서드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 이전에 선택되었던 날짜를 가져옵니다.
        let previousSelectedDate = UserDefaults.standard.object(forKey: "selectedDate") as? Date
        
        // 이전에 선택되었던 날짜의 셀의 폰트 상태를 업데이트합니다.
        if let previousSelectedDate = previousSelectedDate,
           let previousCell = calendar.cell(for: previousSelectedDate, at: .current) {
            configure(cell: previousCell, for: previousSelectedDate)
        }
        
        if let cell = calendar.cell(for: date, at: .current) {
            if date == Date() {
                configure(cell: cell, for: date)
                cell.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
            }
            dateLabel.attributedText = NSMutableAttributedString(string: self.dateFormatter.string(from: date), attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 20)!])
            // 선택한 날짜 저장
            UserDefaults.standard.set(date, forKey: "selectedDate")
        }
        
        // 선택된 날짜와 일치하는 목표 데이터 필터링, collectionView 업데이트
        filterAndReloadData(for: date)
    }
    
    // 이벤트 점을 표시할 날짜를 반환하는 메서드
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        // 해당 날짜의 Goals 객체 필터링
        let goalsForDate = allGoals.filter { $0.date == dateString }
        
        // 날짜가 없거나, 하나라도 조건 만족하지 않는 객체가 있다면 0 리턴
        guard !goalsForDate.isEmpty else { return 0 }
        
        for goal in goalsForDate {
            if goal.second == nil {
                if !goal.first {
                    return 0
                }
            } else {
                if !(goal.first && goal.second! && goal.third!) {
                    return 0
                }
            }
        }
        return 1
    }
    
    // 추가적인 외관 설정 (옵션)
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        return [UIColor.Blue01!] // 이벤트 점의 색상을 설정합니다.
    }
    
    // 선택된 날짜에 해당하는 데이터를 필터링하고 CollectionView를 업데이트하는 메서드
    func filterAndReloadData(for date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let selectedDateStr = dateFormatter.string(from: date)
        
        // 필터링
        selectedGoals = allGoals.filter { $0.date == selectedDateStr }
        
        // 만약 목표가 있으면 script 변경
        if selectedGoals.isEmpty == false {
            script.attributedText = NSMutableAttributedString(string: "파랑 님, 오늘도 할 수 있어요 ☺️", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-SemiBold", size: 16)!])
        } else {
            script.attributedText = NSMutableAttributedString(string: "체크리스트 기록이 없어요 🥲", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-SemiBold", size: 16)!])
        }
        
        // CollectionView 업데이트
        listView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 뷰가 나타날 때 이전에 선택한 날짜가 있다면 선택을 초기화
        if let selectedDate = UserDefaults.standard.object(forKey: "selectedDate") as? Date {
            calendar.deselect(selectedDate)
            dateLabel.attributedText = NSMutableAttributedString(string: self.dateFormatter.string(from: Date()), attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 20)!]) // 오늘 날짜로
        }
        filterAndReloadData(for: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        loadGoalsAndUpdateView()
        
        headerLabel.attributedText = NSMutableAttributedString(string: self.headerDateFormatter.string(from: Date()), attributes: [NSAttributedString.Key.kern: -1.2, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 24)!])
        headerLabel.textColor = UIColor.Blue01
        
        // collectionView 설정
        listView.delegate = self
        listView.dataSource = self
        
        let nibName = UINib(nibName: "CheckListCell", bundle: nil)
        listView.register(nibName, forCellWithReuseIdentifier: "checkCell")
        
        // 캘린더 설정
        calendar.delegate = self
        calendar.dataSource = self
        
        // 캘린더 하단부 그림자 효과
        calendar.layer.masksToBounds = false
        calendar.layer.shadowColor = UIColor(red: 0.835, green: 0.898, blue: 1, alpha: 1).cgColor
        calendar.layer.shadowOpacity = 0.7
        calendar.layer.shadowOffset = CGSize(width: 0, height: 0)
        calendar.layer.shadowRadius = 18
        
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "cell")
        
        // 주간 달력으로 변경
        calendar.scope = .week
        
        // 달력의 요일 한글로
        calendar.locale = Locale(identifier: "ko_KR")
        
        // 폰트 설정 및 크기 설정
        calendar.appearance.weekdayFont = UIFont(name: "Pretendard-Medium", size: 16)
        calendar.appearance.titleFont = UIFont(name: "Pretendard-Medium", size: 16)
        
        // 글자 색상
        calendar.appearance.headerTitleColor = .clear
        calendar.appearance.weekdayTextColor = UIColor.Text03
        calendar.appearance.titleTodayColor = UIColor.Blue01
        
        // 헤더의 날짜 포맷 설정
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerTitleAlignment = .left
        calendar.appearance.headerTitleOffset = .init(x: 0, y:0)
        
        // 높이 설정
        calendar.headerHeight = 15
        calendar.weekdayHeight = 35
        
        // 헤더 양 옆(전달 & 다음 달) 글씨 투명도
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.todayColor = .clear
        
        // 선택한 날짜
        calendar.appearance.titleSelectionColor = UIColor.Text01
        calendar.appearance.selectionColor = UIColor.Blue05
        
        // 하단부 날짜 label text
        dateLabel.attributedText = NSMutableAttributedString(string: self.dateFormatter.string(from: Date()), attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 20)!])
        
        filterAndReloadData(for: Date())
    }
    
    func loadGoalsAndUpdateView() {
        allGoals = UserDefaults.standard.goals(forKey: "goalsDataKey") ?? []
        listView.reloadData()
    }
}
