//
//  ViewController.swift
//  ChatApp
//
//  Created by wyn on 2023/2/24.
//

import UIKit

class ViewController: PushKeyboardViewController {

    @IBOutlet weak var messageTextField: UITextField!
    private let viewModel = MessageViewModel()
    
    @IBAction func didTapView(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func didTapSendButton(_ sender: UIButton) {
        guard let content = messageTextField.text else { return }
        viewModel.appendMessage(content)
        messageTextField.text = nil
        messageTableView.reloadData()
    }
    
    @IBOutlet weak private var messageTableView: UITableView!
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
