//
//  LeftFirstBubbleTableViewCell.swift
//  ChatApp
//
//  Created by wyn on 2023/2/28.
//

import UIKit

class LeftFirstBubbleTableViewCell: UITableViewCell, ChatBubbleTableViewCell {
    @IBOutlet weak private var contentLabel: UILabel!
    func set(_ content: ChatBubble) {
        contentLabel.text = content.content
    }
}
