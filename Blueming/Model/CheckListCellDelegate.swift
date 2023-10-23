import Foundation

protocol CheckListCellDelegate: AnyObject {
    func didTapCheckButton(at indexPath: IndexPath, buttonName: String, newState: Bool)
}
