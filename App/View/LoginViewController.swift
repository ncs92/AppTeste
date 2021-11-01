//
//  ViewController.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 26/10/21.
//

import UIKit
import Foundation

class LoginViewController: UIViewController, LoginProtocol {
    var loginViewModel: LoginViewModel?
    var customLoadingView: CustomLoadingView?
    
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
    
    let emailInputView: CustomInputView = {
        let customInputView = CustomInputView()
        customInputView.customTextField.placeholder = "E-mail"
        customInputView.customTextField.textContentType = .emailAddress
        customInputView.customTextField.required = true
        customInputView.customTextField.messageError = "E-mail inválido"
        customInputView.customTextField.validateFunction = ValidationHelper.validateEmail
        return customInputView
    }()
    
    let passwordInputView: CustomInputView = {
        let customInputView = CustomInputView()
        customInputView.customTextField.placeholder = "Senha"
        customInputView.customTextField.required = true
        customInputView.customTextField.textContentType = .password
        customInputView.customTextField.isSecureTextEntry = true
        customInputView.customTextField.messageError = "A senha deve possuir pelo menos 8 caracteres, ao menos uma letra maiúscula e um número"
        customInputView.customTextField.validateFunction = ValidationHelper.validatePassword
        return customInputView
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu sua senha?", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.contentHorizontalAlignment = .right
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
        textView.textAlignment = .right
        textView.textColor = .lightGray
        return textView
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("REGISTRE-SE", for: .normal)
        button.setTitleColor(UIColor.secondary(), for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    // MARK: - StackViews
    
    let stackViewHeader: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
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
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let stackViewFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
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
        stack.spacing = 8
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
        return stack
    }()
    
    let stackViewContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.bounces = false
        return scroll
    }()
    
    let viewContent: UIView = {
        let viewBody = UIView()
        viewBody.translatesAutoresizingMaskIntoConstraints = false
        return viewBody
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserService.hasToken() && UserService.hasUser()) {
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
        view.addSubview(scrollView)
        view.backgroundColor = UIColor.primary()
        
        loginViewModel = LoginViewModel()
        loginViewModel?.delegate = self
        
        setupLayout()
        setupActions()
                
        customLoadingView = CustomLoadingView(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setArrangedSubviewStacks () {
        stackViewTitles.addArrangedSubview(titleTextView)
        stackViewTitles.addArrangedSubview(subtitleTextView)
                
        stackViewHeader.addArrangedSubview(pencilImageView)
        stackViewHeader.addArrangedSubview(stackViewTitles)
        
        stackViewForm.addArrangedSubview(emailInputView)
        stackViewForm.addArrangedSubview(passwordInputView)
        stackViewForm.addArrangedSubview(forgotPasswordButton)
        
        stackViewRegister.addArrangedSubview(doNotHaveAccountTextView)
        stackViewRegister.addArrangedSubview(registerButton)
        
        stackViewFooter.addArrangedSubview(loginButton)
        stackViewFooter.addArrangedSubview(stackViewRegister)
        
        stackViewBody.addArrangedSubview(stackViewHeader)
        stackViewBody.addArrangedSubview(stackViewForm)
        
        stackViewContent.addArrangedSubview(stackViewBody)
        stackViewContent.addArrangedSubview(stackViewFooter)
    }
    
    func setupLayout() {
        setArrangedSubviewStacks()
        viewContent.addSubview(stackViewContent)
        setupScrollView()
        
        stackViewContent.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 20).isActive = true
        stackViewContent.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: 20).isActive = true
        stackViewContent.rightAnchor.constraint(equalTo: viewContent.rightAnchor, constant: -20).isActive = true
        stackViewContent.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -20).isActive = true
    }
    
    func setupScrollView(){
        scrollView.addSubview(viewContent)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
           
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        scrollView.autoresizingMask = .flexibleHeight
        viewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        viewContent.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        viewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        viewContent.heightAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        viewContent.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

       }
    
    @objc func goToRegisterView() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func onLogin() {
        guard let email = emailInputView.customTextField.text else { return }
        guard let password = passwordInputView.customTextField.text else { return }
        
        guard let viewModel = loginViewModel else { return }
        
        var validateFields: Array<Bool> = []
        
        validateFields.append(emailInputView.hasError)
        validateFields.append(passwordInputView.hasError)
        
        let isValidForm = viewModel.validateForm(validateFields: validateFields)
        
        if (isValidForm) {
            customLoadingView?.startLoading()
            viewModel.requestLogin(email: email, password: password)
        } else {
            let alert = Alert(controller: self)
            alert.show("Os dados informados estão inválidos. Verifique o e-mail e a senha e tente novamente.")
        }
    }

    func setupActions() {
        registerButton.addTarget(self, action: #selector(goToRegisterView), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
    }
    
    func sucessLogin() {
        customLoadingView?.stopLoading()
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    func errorLogin(_ message: String) {
        customLoadingView?.stopLoading()
        let alert = Alert(controller: self)
        alert.show(message)
    }

}

