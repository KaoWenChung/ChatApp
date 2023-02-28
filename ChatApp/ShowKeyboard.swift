//
//  ShowKeyboard.swift
//  ChatApp
//
//  Created by wyn on 2023/2/28.
//

import UIKit

class PushKeyboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.size.height == UIScreen.main.bounds.height {
                view.frame.size.height -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        // Reset the position of your view to its original state
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.size.height != UIScreen.main.bounds.height {
                view.frame.size.height += keyboardSize.height
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
