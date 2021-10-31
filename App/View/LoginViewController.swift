//
//  ViewController.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 26/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let pencilImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "pencil.and.outline"))
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.secondary()
        return imageView
    }()
    
    let titleTextView: CustomLabel = {
       let textView = CustomLabel()
        textView.text = "Continue com o seu"
        textView.textAlignment = .left
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        return textView
    }()
    
    let subtitleTextView: CustomLabel = {
        let textView = CustomLabel()
        textView.text = "Login"
        textView.font = UIFont.boldSystemFont(ofSize: 32)
        textView.textAlignment = .left
        return textView
     }()
    
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "E-mail"
        textField.textContentType = .emailAddress
        return textField
    } ()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Senha"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        return textField
    } ()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu sua senha?", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .brown
        return button
    }()
    
    let loginButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = UIColor.secondary()
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let doNotHaveAccountTextView: CustomLabel = {
       let textView = CustomLabel()
        textView.text = "Não tem uma conta?"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.backgroundColor = .purple
        return textView
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("REGISTRE-SE", for: .normal)
        button.setTitleColor(UIColor.secondary(), for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    // MARK: - StackViews
    
    let stackViewHeader: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
//        stack.backgroundColor = .red
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let stackViewTitles: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let stackViewForm: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.backgroundColor = .purple
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let stackViewActions: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.backgroundColor = .gray
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let viewRegister: UIView = {
        let viewRegister = UIView()
        return viewRegister
    }()
    
    let stackViewRegister: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.backgroundColor = .black
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let stackViewBody: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.backgroundColor = .blue
        return stack
    }()
    
    let stackViewContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
//        stack.backgroundColor = .blue
        stack.alignment = .fill
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.primary()
        view.addSubview(stackViewContent)
       
        setupLayout()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setArrangedSubviewStacks () {
        stackViewTitles.addArrangedSubview(titleTextView)
        stackViewTitles.addArrangedSubview(subtitleTextView)
                
        stackViewHeader.addArrangedSubview(pencilImageView)
        stackViewHeader.addArrangedSubview(stackViewTitles)
        
        stackViewForm.addArrangedSubview(emailTextField)
        stackViewForm.addArrangedSubview(passwordTextField)
        stackViewForm.addArrangedSubview(forgotPasswordButton)
        
        stackViewRegister.addArrangedSubview(doNotHaveAccountTextView)
        stackViewRegister.addArrangedSubview(registerButton)
        
        stackViewActions.addArrangedSubview(loginButton)
        stackViewActions.addArrangedSubview(stackViewRegister)
        
        stackViewBody.addArrangedSubview(stackViewHeader)
        stackViewBody.addArrangedSubview(stackViewForm)
        
        stackViewContent.addArrangedSubview(stackViewBody)
        stackViewContent.addArrangedSubview(stackViewActions)
    }
    
    func setupLayout() {
        setArrangedSubviewStacks()
        
        stackViewContent.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        stackViewContent.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackViewContent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        stackViewContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func goToRegisterView() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func goToHomeView() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }

    func setupActions() {
        registerButton.addTarget(self, action: #selector(goToRegisterView), for: .touchUpInside)
        
        loginButton.addTarget(self, action: #selector(goToHomeView), for: .touchUpInside)
    }

}

