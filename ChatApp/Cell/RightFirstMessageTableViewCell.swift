//
//  RightFirstMessageTableViewCell.swift
//  ChatApp
//
//  Created by wyn on 2023/2/24.
//

import UIKit

class RightFirstMessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var contentLabel: UILabel!

    func set(_ content: String) {
        contentLabel.text = content
    }
}
