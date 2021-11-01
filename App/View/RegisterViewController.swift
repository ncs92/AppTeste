//
//  RegisterViewController.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 28/10/21.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, RegisterProtocol {
    var registerViewModel: RegisterViewModel?
    var customLoadingView: CustomLoadingView?
    
    // MARK: - StackViewHeader
    
    let pencilImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "pencil.and.outline"))
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.secondary()
        return imageView
    }()
    
    let registerTextView: CustomLabel = {
        let textView = CustomLabel()
        textView.text = "Registro"
        textView.font = UIFont.boldSystemFont(ofSize: 32)
        textView.textAlignment = .left
        return textView
     }()
    
    let stackViewHeader: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - StackViewForm
        
    let nameInputView: CustomInputView = {
        let customInputView = CustomInputView()
        customInputView.customTextField.placeholder = "Nome Completo"
        customInputView.customTextField.required = true
        customInputView.customTextField.messageError = "Nome e sobrenome são necessários"
        customInputView.customTextField.validateFunction = ValidationHelper.validateName
        return customInputView
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
    
    let cpfInputView: CustomInputView = {
        let customInputView = CustomInputView()
        customInputView.customTextField.placeholder = "CPF"
        customInputView.customTextField.required = true
        customInputView.customTextField.textContentType = .telephoneNumber
        customInputView.customTextField.messageError = "CPF inválido"
        customInputView.customTextField.validateFunction = ValidationHelper.validateCPF
        return customInputView
    }()
    
    let phoneInputView: CustomInputView = {
        let customInputView = CustomInputView()
        customInputView.customTextField.placeholder = "Celular"
        customInputView.customTextField.required = true
        customInputView.customTextField.textContentType = .telephoneNumber
        customInputView.customTextField.messageError = "O número de telefone deve conter 11 dígitos, contando com o DDD"
        customInputView.customTextField.validateFunction = ValidationHelper.validatePhoneNumber
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
    
    let passwordConfirmInputView: CustomInputView = {
        let customInputView = CustomInputView()
        customInputView.customTextField.placeholder = "Confirmação de Senha"
        customInputView.customTextField.textContentType = .password
        customInputView.customTextField.isSecureTextEntry = true
        customInputView.customTextField.messageError = "A confirmação de senha deve ser igual à senha inserida"
        return customInputView
    }()
    
    let receiveUpdatesTextView: CustomLabel = {
        let textView = CustomLabel()
        textView.text = "Receber atualizações por e-mail"
        textView.font = UIFont.systemFont(ofSize: 18)
        return textView
    }()
    
    let receiveUpdatesSwitch: UISwitch = {
        let switchUpdate = UISwitch()
        switchUpdate.isOn = true
        return switchUpdate
    }()
    
    let stackViewUpdates: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackViewForm: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - StackViewFooter
    
    let registerButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("REGISTRAR", for: .normal)        
        return button
    }()
    
    let haveAccountTextView: CustomLabel = {
       let textView = CustomLabel()
        textView.text = "Já possui uma conta?"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.textAlignment = .right
        textView.textColor = .lightGray
        return textView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(UIColor.secondary(), for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
        
    let stackViewFooter: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    let stackViewLogin: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: - StackViewBody
    
    let stackViewBody: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - StackViewContent
    
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
        
        registerViewModel = RegisterViewModel()
        registerViewModel?.delegate = self
                
        view.backgroundColor = UIColor.primary()
        view.addSubview(scrollView)
       
        setupLayout()
        setupActions()
        
        customLoadingView = CustomLoadingView(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setArrangedSubviewStacks() {
        stackViewHeader.addArrangedSubview(pencilImageView)
        stackViewHeader.addArrangedSubview(registerTextView)
        
        stackViewUpdates.addArrangedSubview(receiveUpdatesTextView)
        stackViewUpdates.addArrangedSubview(receiveUpdatesSwitch)
        
        stackViewForm.addArrangedSubview(nameInputView)
        stackViewForm.addArrangedSubview(emailInputView)
        stackViewForm.addArrangedSubview(cpfInputView)
        stackViewForm.addArrangedSubview(phoneInputView)
        stackViewForm.addArrangedSubview(passwordInputView)
        stackViewForm.addArrangedSubview(passwordConfirmInputView)
        stackViewForm.addArrangedSubview(stackViewUpdates)
        
        stackViewLogin.addArrangedSubview(haveAccountTextView)
        stackViewLogin.addArrangedSubview(loginButton)
        
        stackViewFooter.addArrangedSubview(registerButton)
        stackViewFooter.addArrangedSubview(stackViewLogin)
        
        stackViewBody.addArrangedSubview(stackViewHeader)
        stackViewBody.addArrangedSubview(stackViewForm)
        
        stackViewContent.addArrangedSubview(stackViewBody)
        stackViewContent.addArrangedSubview(stackViewFooter)
    }
    
    func setupLayout() {
        setArrangedSubviewStacks()
        viewContent.addSubview(stackViewContent)
        setupScrollView()
        
        stackViewContent.topAnchor.constraint(equalTo: viewContent.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
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
    
    @objc func goToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goToRegister() {
        guard let viewModel = registerViewModel else { return }
        
        var validateFields: Array<Bool> = []
        
        validateFields.append(nameInputView.hasError)
        validateFields.append(emailInputView.hasError)
        validateFields.append(cpfInputView.hasError)
        validateFields.append(phoneInputView.hasError)
        validateFields.append(passwordInputView.hasError)
                
        guard let password = passwordInputView.customTextField.text else { return }
        guard let confirmPassword = passwordConfirmInputView.customTextField.text else { return }
        
        let isValidForm: Bool = viewModel.validateForm(validateFields: validateFields, password: password, confirmPassword: confirmPassword)
        
        if (isValidForm) {
            guard let name = nameInputView.customTextField.text else { return }
            guard let email = emailInputView.customTextField.text else { return }
            guard let cpf = cpfInputView.customTextField.text else { return }
            guard let phoneNumber = phoneInputView.customTextField.text else { return }
            let emailUpdatesAllowed = receiveUpdatesSwitch.isOn
            
            customLoadingView?.startLoading()
            
            viewModel.requestRegister(name: name, email: email, cpf: cpf, phoneNumber: phoneNumber, password: password, emailUpdatesAllowed: emailUpdatesAllowed)
        }
    }

    func setupActions() {
        loginButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
    }
    
    // MARK: - Funções do protocolo
    
    func setMessageInvalidConfirmPassword(_ isValid: Bool) {
        passwordConfirmInputView.showError = !isValid
    }
    
    func sucessRegister(_ message: String) {
        customLoadingView?.stopLoading()
        let alert = Alert(controller: self)
        alert.show(message) { UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func errorRegister(_ message: String) {
        customLoadingView?.stopLoading()
        let alert = Alert(controller: self)
        alert.show(message)
    }

}
