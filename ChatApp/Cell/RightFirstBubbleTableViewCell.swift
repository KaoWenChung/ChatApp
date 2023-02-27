//
//  RightFirstMessageTableViewCell.swift
//  ChatApp
//
//  Created by wyn on 2023/2/24.
//

import UIKit

class RightFirstBubbleTableViewCell: UITableViewCell, ChatBubbleTableViewCell {
    
    @IBOutlet weak private var contentLabel: UILabel!

    func set(_ content: ChatBubble) {
        contentLabel.text = content.content
    }
}
