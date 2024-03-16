//
//  UITableView+Extention.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

extension UITableView {
    func reloadHeight(for time: DispatchTime = .now() + 0.1) {
        DispatchQueue.main.asyncAfter(deadline: time) {
            if let constraint = self.constraints.first(where: { $0.firstAttribute == .height }) {
                constraint.constant = self.contentSize.height
            }
        }
    }
    
    func setHeight(for height: CGFloat = 200) {
        if let constraint = self.constraints.first(where: { $0.firstAttribute == .height }) {
            constraint.constant = height
        }
    }
}

extension UITableView {
    /// func cell Template
    ///
    /// - Parameters:
    ///   - cell: Template
    ///   - indexPath: indexpath
    ///   - register: register
    /// - Returns: return the template cell
    func cell<T>(type: T.Type, _ indexPath: IndexPath, register: Bool = true) -> T {
        let ind = String(describing: type)
        if register {
            self.register(UINib(nibName: ind, bundle: nil), forCellReuseIdentifier: ind)
        }
        let cellProt = self.dequeueReusableCell(withIdentifier: ind, for: indexPath) as? T
        if cellProt is CellProtocol {
            var cell = cellProt as? CellProtocol
            cell?.path = indexPath.item
            if let cell = cell as? T {
                return cell
            } else {
                return cellProt!
            }
        } else {
            return cellProt!
        }
    }
    
    func identifier<T>(type: T.Type, register: Bool = true) -> String {
        let identifier = String(describing: type)
        if register {
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
        return identifier
    }
}

extension UITableViewCell {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func getIndexPath() -> IndexPath? {
        guard let indexPath = (self.superview as? UITableView)?.indexPath(for: self) else {return nil}
        return indexPath
    }
}
