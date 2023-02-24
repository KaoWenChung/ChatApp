//
//  ViewController.swift
//  ChatApp
//
//  Created by wyn on 2023/2/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Message"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemCyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

