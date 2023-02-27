//
//  RightOthersTableViewCell.swift
//  ChatApp
//
//  Created by wyn on 2023/2/27.
//

import UIKit

class RightOthersBubbleTableViewCell: UITableViewCell, ChatBubbleTableViewCell {

    @IBOutlet weak private var contentLabel: UILabel!

    func set(_ content: ChatBubble) {
        contentLabel.text = content.content
    }
}
