//
//  ViewController.swift
//  Instagram
//
//  Created by Hayk Zakaryan on 9/8/20.
//  Copyright © 2020 Hayk Zakaryan. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNorAuthenticated()
    }
    
    private func handleNorAuthenticated() {
        //check auth
        if Auth.auth().currentUser == nil {
            //Show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC,animated: true)
        }
    }

}

