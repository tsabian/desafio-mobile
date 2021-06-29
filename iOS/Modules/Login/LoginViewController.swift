//
//  LoginViewController.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 12/06/21.
//

import UIKit

// MARK: - LoginViewControllerCoordinator
protocol LoginViewControllerCoordinator: AnyObject {
    func goToRegister()
    func goToHome()
}

// MARK: - LoginViewController
class LoginViewController: BaseViewController {

    var viewModel: LoginViewModelProtocol
    weak var coordinator: LoginViewControllerCoordinator?

    // MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView! {
        didSet {
            backgroundImage.contentMode = .scaleAspectFill
            backgroundImage.image = UIImage(named: "img-background") ?? UIImage()
        }
    }
    
    @IBOutlet weak var backgroundGradientTopView: UIView! {
        didSet {
            backgroundGradientTopView.backgroundColor = UIColor.clear
            let gradient = CAGradientLayer()
            gradient.frame = backgroundGradientTopView.bounds
            gradient.colors = [UIColor.white.cgColor,
                               UIColor.white.cgColor,
                               UIColor.white.withAlphaComponent(0).cgColor]
            gradient.locations = [0, 0.2, 1]
            backgroundGradientTopView.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    @IBOutlet weak var backgroundGradientBottomView: UIView! {
        didSet {
            backgroundGradientBottomView.backgroundColor = UIColor.clear
            let gradient = CAGradientLayer()
            gradient.frame = backgroundGradientBottomView.bounds
            gradient.colors = [UIColor.white.withAlphaComponent(0.0).cgColor,
                               UIColor.white.cgColor,
                               UIColor.white.cgColor]
            gradient.locations = [0, 0.9, 1]
            backgroundGradientBottomView.layer.insertSublayer(gradient, at: 0)
        }
    }

    @IBOutlet weak var formScrollView: UIScrollView! {
        didSet {
            formScrollView.backgroundColor = UIColor.clear
        }
    }
    
    @IBOutlet weak var formContentView: UIView! {
        didSet {
            formContentView.backgroundColor = UIColor.clear
        }
    }
    
    @IBOutlet weak var logoImage: UIImageView! {
        didSet {
            logoImage.clipsToBounds = true
            logoImage.image = UIImage(named: "img-logo")
            logoImage.contentMode = .center
        }
    }
    
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.text = LocalizableKeys.Login.emailLabelTitle.localized
            emailLabel.font = FontManager.shared.bold(size: 12)
        }
    }
    
    @IBOutlet weak var loginEmailText: LocalTextField! {
        didSet {
            loginEmailText.placeholder = LocalizableKeys.Login.emailTextPlaceHolder.localized
            loginEmailText.delegate = self
            loginEmailText.font = FontManager.shared.regular(size: 17)
        }
    }
    
    @IBOutlet weak var passwordLabel: UILabel! {
        didSet {
            passwordLabel.text = LocalizableKeys.Login.passwordLabelTitle.localized
            passwordLabel.font = FontManager.shared.bold(size: 12)
        }
    }

    @IBOutlet weak var loginPasswordView: UIView! {
        didSet {
            loginPasswordView.clipsToBounds = true
            loginPasswordView.backgroundColor = UIColor.clear
        }
    }
    
    @IBOutlet weak var loginPasswordText: LocalTextField! {
        didSet {
            let attributes = [NSAttributedString.Key.font: FontManager.shared.regular(size: 17)]
            loginPasswordText.attributedPlaceholder = NSAttributedString(string: LocalizableKeys.Login.passwordTextPlaceHolder.localized,
                                                                         attributes: attributes)
            loginPasswordText.delegate = self
            loginPasswordText.font = FontManager.shared.regular(size: 17)
        }
    }
    
    @IBOutlet weak var forgotPasswordButton: UIButton! {
        didSet {
            forgotPasswordButton.setTitle(LocalizableKeys.Login.rememberPasswordLabelTitle.localized, for: .normal)
            forgotPasswordButton.titleLabel?.font = FontManager.shared.bold(size: 11)
            forgotPasswordButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    @IBOutlet weak var signInButton: LocalButton! {
        didSet {
            signInButton.buttonStyle = .fillStyle
            signInButton.setTitle(LocalizableKeys.Login.loginButtonTitle.localized, for: .normal)
        }
    }
    
    @IBOutlet weak var signInSocialView: UIView! {
        didSet {
            signInSocialView.isHidden = true
        }
    }
    
    @IBOutlet weak var accountInfoLabel: UILabel! {
        didSet {
            accountInfoLabel.textAlignment = .center
            accountInfoLabel.text = LocalizableKeys.Login.registerInfoLabelTitle.localized
            accountInfoLabel.font = FontManager.shared.regular(size: 14)
            accountInfoLabel.textColor = UIColor(named: "#6F6F6FA3")
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.setTitle(LocalizableKeys.Login.registerButtonTitle.localized, for: .normal)
        }
    }

    // MARK: - Life Cycle
    convenience init() {
        self.init(viewModel: LoginViewModel())
    }

    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        viewModel = LoginViewModel()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        hiddeKeyboardOnTapGesture()
    }

    // MARK: - Listener
    private func listener() {
        viewModel.viewStatus.bind(to: self) { (target, viewStatus) in
            guard let status = viewStatus else { return }
            switch status {
            case .loginFailure:
                break
            case .loginSuccess:
                target.coordinator?.goToHome()
            case .genericFailure:
                break
            case .credentialsCannotBeNull:
                break
            }
        }
    }

    // MARK: - Actions
    @IBAction func registerDidTap(_ sender: UIButton) {
        coordinator?.goToRegister()
    }

    @IBAction func signInDidTap(_ sender: UIButton) {
        
    }
    
    private func signIn() {
        viewModel.signInWithCredentials(email: loginEmailText.text, andSecurityPassword: loginEmailText.text)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
