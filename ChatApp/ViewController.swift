//
//  ViewController.swift
//  ChatApp
//
//  Created by wyn on 2023/2/24.
//

import UIKit

class ViewController: PushKeyboardViewController {
    
    @IBAction func didTapView(_ sender: Any) {
        view.endEditing(true)
    }

    @IBOutlet weak private var messageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Message"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemCyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        messageTableView.register(UINib(nibName: "RightFirstBubbleTableViewCell", bundle: nil), forCellReuseIdentifier: "RightFirstBubbleTableViewCell")
        messageTableView.register(UINib(nibName: "RightOthersBubbleTableViewCell", bundle: nil), forCellReuseIdentifier: "RightOthersBubbleTableViewCell")
        messageTableView.register(UINib(nibName: "LeftFirstBubbleTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftFirstBubbleTableViewCell")
        messageTableView.register(UINib(nibName: "LeftOthersBubbleTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftOthersBubbleTableViewCell")
    }
}

let mockContent = [ChatBubble(type: .rightOthers, content: "conent", userName: "Mike"),
                   ChatBubble(type: .rightFirst, content: "conentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconent", userName: "Mike"),
                   ChatBubble(type: .leftOthers, content: "conentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconentconent", userName: "Jay"),
                   ChatBubble(type: .leftFirst, content: "conentconentconent", userName: "Jay")]
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bubbleContent = mockContent[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: bubbleContent.type.rawValue) as? ChatBubbleTableViewCell else { return UITableViewCell() }
        
        cell.set(bubbleContent)
        return cell
    }
}

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
