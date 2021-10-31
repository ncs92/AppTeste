//
//  HomeViewController.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 28/10/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let contentView: UIView = {
        let content = UIView()
        
        return content
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.primary()
        view.addSubview(contentView)
       
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupLayout() {
        
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}
