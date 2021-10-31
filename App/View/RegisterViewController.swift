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
    
//    let activityIndicator = CustomActivityIndicator(style: UIActivityIndicatorView.Style.large)
//    let customVisualEffect = CustomVisualEffectView()
    
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
//        stack.backgroundColor = .green
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
//        textView.backgroundColor = .purple
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
//        stack.backgroundColor = .red
        return stack
    }()
    
    let stackViewForm: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.backgroundColor = .purple
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
        textView.backgroundColor = .purple
        textView.textAlignment = .center
        return textView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(UIColor.secondary(), for: .normal)
        button.backgroundColor = .green
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
//        stackView.distribution = .fillProportionally
        stackView.contentMode = .center
        stackView.backgroundColor = .blue
        return stackView
    }()
    
    // MARK: - StackViewBody
    
    let stackViewBody: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.backgroundColor = .blue
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
//        stack.backgroundColor = .blue
        return stack
    }()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerViewModel = RegisterViewModel()
        registerViewModel?.delegate = self
                
        view.backgroundColor = UIColor.primary()
        view.addSubview(scrollView)
//        view.addSubview(customVisualEffect)
//        view.addSubview(activityIndicator)
       
        setupLayout()
        setupActions()
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
    
    let viewContent: UIView = {
        let viewBody = UIView()
        return viewBody
    }()
    
    
    func setupLayout() {
        viewContent.addSubview(stackViewContent)
        
        setArrangedSubviewStacks()
        setupScrollView()
        
        stackViewContent.topAnchor.constraint(equalTo: viewContent.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackViewContent.leftAnchor.constraint(equalTo: viewContent.leftAnchor, constant: 20).isActive = true
        stackViewContent.rightAnchor.constraint(equalTo: viewContent.rightAnchor, constant: -20).isActive = true
        stackViewContent.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -20).isActive = true
        
//        customVisualEffect.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        customVisualEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        customVisualEffect.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        customVisualEffect.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        
//        activityIndicator.centerXAnchor.constraint(equalTo: customVisualEffect.centerXAnchor).isActive = true
//        activityIndicator.centerYAnchor.constraint(equalTo: customVisualEffect.centerYAnchor).isActive = true
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        viewContent.translatesAutoresizingMaskIntoConstraints = false
 
        scrollView.addSubview(viewContent)
           
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           
        viewContent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        viewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        viewContent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        viewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true

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
        
        print(isValidForm)
        
        if (isValidForm) {
            guard let name = nameInputView.customTextField.text else { return }
            guard let email = emailInputView.customTextField.text else { return }
            guard let cpf = cpfInputView.customTextField.text else { return }
            guard let phoneNumber = phoneInputView.customTextField.text else { return }
            let emailUpdatesAllowed = receiveUpdatesSwitch.isOn
            
//            self.activityIndicator.loading = true
//            self.customVisualEffect.isHidden = false
            
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
//        self.activityIndicator.isHidden = true
//        self.activityIndicator.stopAnimating()
//        self.customVisualEffect.isHidden = true
        
        let alert = Alert(controller: self)
        alert.show(message) { UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func errorRegister(_ message: String) {
//        self.activityIndicator.isHidden = true
//        self.activityIndicator.stopAnimating()
//        self.customVisualEffect.isHidden = true
        print("Entrou error ")
        
        let alert = Alert(controller: self)
        alert.show(message)
    }

}
