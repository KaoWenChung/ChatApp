//
//  ViewController.swift
//  ChatApp
//
//  Created by wyn on 2023/2/24.
//

import UIKit

class ViewController: PushKeyboardViewController {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak private var messageTableView: UITableView!

    private let viewModel = MessageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Message"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemCyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        messageTableView.register(cells: [RightFirstBubbleTableViewCell.self,
                                          RightOthersBubbleTableViewCell.self,
                                          LeftFirstBubbleTableViewCell.self,
                                          LeftOthersBubbleTableViewCell.self])
    }

    @IBAction private func didTapView(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction private func didTapSendButton(_ sender: UIButton) {
        guard let content = messageTextField.text, !content.isEmpty else { return }
        viewModel.appendMessage(content)
        messageTextField.text = nil
        messageTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bubbleContent = viewModel.messageList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: bubbleContent.type.rawValue) as? ChatBubbleTableViewCell else { return UITableViewCell() }
        
        cell.set(bubbleContent)
        return cell
    }
}
