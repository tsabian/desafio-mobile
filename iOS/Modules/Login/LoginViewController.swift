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
                               UIColor.white.withAlphaComponent(0).cgColor]
            backgroundGradientTopView.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    @IBOutlet weak var backgroundGradientBottomView: UIView! {
        didSet {
            backgroundGradientBottomView.backgroundColor = UIColor.clear
            let gradient = CAGradientLayer()
            gradient.frame = backgroundGradientBottomView.bounds
            gradient.colors = [UIColor.white.withAlphaComponent(0.0).cgColor,
                               UIColor.white.cgColor]
            backgroundGradientBottomView.layer.insertSublayer(gradient, at: 0)
        }
    }

    @IBOutlet weak var logoImage: UIImageView! {
        didSet {
            logoImage.image = UIImage(named: "img-logo")
        }
    }
    
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.text = LocalizableKeys.Login.emailLabelTitle.localized
        }
    }
    
    @IBOutlet weak var loginEmailText: LocalTextField! {
        didSet {
            loginEmailText.placeholder = LocalizableKeys.Login.emailTextPlaceHolder.localized
        }
    }
    
    @IBOutlet weak var passwordLabel: UILabel! {
        didSet {
            passwordLabel.text = LocalizableKeys.Login.passwordLabelTitle.localized
        }
    }

    @IBOutlet weak var loginPasswordView: UIView! {
        didSet {
            loginPasswordView.backgroundColor = UIColor.clear
        }
    }
    
    @IBOutlet weak var loginPasswordText: LocalTextField! {
        didSet {
            loginPasswordText.placeholder = LocalizableKeys.Login.passwordTextPlaceHolder.localized
        }
    }
    
    @IBOutlet weak var forgotPasswordButton: UIButton! {
        didSet {
            forgotPasswordButton.setTitle(LocalizableKeys.Login.rememberPasswordLabelTitle.localized, for: .normal)
        }
    }
    
    @IBOutlet weak var signInButton: LocalButton! {
        didSet {
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
