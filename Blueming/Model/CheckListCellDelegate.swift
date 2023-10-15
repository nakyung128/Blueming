//
//  CheckListCellDelegate.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/16.
//

import Foundation

protocol CheckListCellDelegate: AnyObject {
    func didTapCheckButton(at indexPath: IndexPath, buttonName: String, newState: Bool)
}
