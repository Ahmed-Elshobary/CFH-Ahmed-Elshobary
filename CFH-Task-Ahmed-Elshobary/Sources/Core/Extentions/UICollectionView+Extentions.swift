//
//  UICollectionView+Extentions.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

// MARK: - ...  Cell Protocol Must all cells implement this protocol
public protocol CellProtocol {
    var model: Any? { get set }
    var path: Int? { get set }
    func indexPath() -> Int
    func setup()
}


extension UICollectionView {
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
            self.register(UINib(nibName: ind, bundle: nil), forCellWithReuseIdentifier: ind)
        }
        let cellProtcol = self.dequeueReusableCell(withReuseIdentifier: ind, for: indexPath) as? T
        if var cell = cellProtcol as? CellProtocol {
            cell.path = indexPath.item
            if let cell = cell as? T {
                return cell
            } else {
                return cellProtcol!
            }
        } else {
            return cellProtcol!
        }
    }
    
    func identifier<T>(type: T.Type, register: Bool = true) -> String {
        let identifier = String(describing: type)
        if register {
            self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
        return identifier
    }
    
    func reusableView<T>(type: T.Type, kind: String, _ indexPath: IndexPath, register: Bool = true) -> UICollectionReusableView {
        let identifier = String(describing: type)
        if register {
            self.register(UINib(nibName: identifier, bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        }
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
    }
    
}
