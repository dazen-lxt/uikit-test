//
//  UITableViewCell+ReusableCell.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell: T = dequeueReusableCell(
            withIdentifier: T.defaultReuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
