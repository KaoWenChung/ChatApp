//
//  Created by wyn on 2023/3/1.
//

import UIKit

protocol ChatBubbleTableViewCell: UITableViewCell {
    func set(_ content: ChatBubble)
}

struct ChatBubble {
    enum ChatBubbleType: String {
        case rightFirst = "RightFirstBubbleTableViewCell"
        case rightOthers = "RightOthersBubbleTableViewCell"
        case leftFirst = "LeftFirstBubbleTableViewCell"
        case leftOthers = "LeftOthersBubbleTableViewCell"
    }
    let type: ChatBubbleType
    let content: String
    let userName: String
    init(type: ChatBubbleType, content: String, userName: String) {
        self.type = type
        self.content = content
        self.userName = userName
    }
}
