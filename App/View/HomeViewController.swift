//
//  HomeViewController.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 28/10/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    private let welcomeText: CustomLabel = CustomLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.primary()
        view.addSubview(welcomeText)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.secondary()
        self.navigationItem.hidesBackButton = true        
       
        setupLayout()
        setWelcomeText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setWelcomeText() {
        guard let user = UserService.getUser() else { return }
        guard let userName = user["name"] else { return }

        welcomeText.numberOfLines = 6
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.right
        
        let attributedText =  NSMutableAttributedString(string: "")
        attributedText.append(NSAttributedString(string: "Olá,\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\(userName)\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize:60), NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "Você foi logado com sucesso!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.paragraphStyle: paragraphStyle
                                                                
        ]))
        welcomeText.attributedText = attributedText
    }
    
    func setupLayout() {
        welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func logout() {
        UserService.logout()
        self.navigationController?.popViewController(animated: true)
    }
}
