//
//  Created by wyn on 2023/3/1.
//

import UIKit

extension UITableView {
    func register(cells: [UITableViewCell.Type]) {
        for cell in cells {
            register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellReuseIdentifier: String(describing: cell.self))
        }
    }
}
