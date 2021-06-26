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
            backgroundImage.image = UIImage(named: "img-background") ?? UIImage()
        }
    }
    @IBOutlet weak var loginEmailText: UITextField! {
        didSet {
            loginEmailText.placeholder = LocalizableKeys.LoginLocalizable.emailTextPlaceHolder.localized
        }
    }
    @IBOutlet weak var loginPasswordText: UITextField! {
        didSet {
            loginPasswordText.placeholder = LocalizableKeys.LoginLocalizable.passwordTextPlaceHolder.localized
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
        self.viewModel = LoginViewModel()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
