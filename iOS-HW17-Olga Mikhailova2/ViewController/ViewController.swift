
import UIKit

class ViewController: UIViewController {
  // MARK: - Properties
  
  private lazy var backgroundView = LoginBackgroundView()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Login"
    label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    label.textAlignment = .center
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var loginTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Username"
    textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
    textField.layer.cornerRadius = 20
    textField.borderStyle = .none
    textField.setLeftIcon(UIImage(systemName: "person") ?? UIImage())
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private lazy var passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
    textField.layer.cornerRadius = 20
    textField.borderStyle = .none
    textField.setLeftIcon(UIImage(systemName: "lock") ?? UIImage())
    textField.setRightIcon(UIImage(systemName: "checkmark.circle.fill")?
      .withTintColor(.systemGreen, renderingMode: .alwaysOriginal) ?? UIImage())
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private lazy var loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Login", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemIndigo
    button.layer.cornerRadius = 20
    button.addShadow()
    button.addTarget(self, action: #selector( loginButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var forgotButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Forgot your password?", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .none
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var dividerLeftView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var dividerRightView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var connectLabel: UILabel = {
    let label = UILabel()
    label.text = "or connect with"
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .gray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var facebookButton: UIButton = {
    let button = UIButton(type: .custom) // Важно: .custom вместо .system
    
    var config = UIButton.Configuration.filled()
    config.cornerStyle = .capsule
    config.baseForegroundColor = .white
    config.baseBackgroundColor = .systemBlue
    config.title = "Facebook"
    config.titleTextAttributesTransformer =
    UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      return outgoing
    }
    config.image = UIImage(named: "facebook")?.withTintColor(.white)
      .resized(to: CGSize(width: 24, height: 24))
    config.imagePadding = 8 // Отступ между иконкой и текстом
    config.imagePlacement = .leading
    //        config.preferredSymbolConfigurationForImage // видимо ток для SF Symbols...не
    //        работает
    //        = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
    config.contentInsets = NSDirectionalEdgeInsets(// Внутренние отступы кнопки
      top: 5, leading: 12, bottom: 5, trailing: 20)
    
    button.configuration = config
    button.addShadow()
    button.addTarget(self, action: #selector(fbButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var twitterButton: UIButton = {
    let button = UIButton(type: .custom)
    
    var config = UIButton.Configuration.filled()
    config.cornerStyle = .capsule
    config.baseForegroundColor = .white
    config.baseBackgroundColor = .systemIndigo
    config.title = "Twitter"
    config.titleTextAttributesTransformer =
    UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      return outgoing
    }
    config.image = UIImage(named: "twitter")?.withTintColor(.white)
      .resized(to: CGSize(width: 26, height: 26))
    config.imagePadding = 8
    config.imagePlacement = .leading
    config.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                   leading: 12,
                                                   bottom: 5,
                                                   trailing: 20)
    
    button.configuration = config
    button.addShadow()
    button.addTarget(self, action: #selector(twitterButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let signUpLabel: UILabel = {
    let label = UILabel()
    label.text = "Don't have account?"
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .gray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let signUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign up", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    button.setTitleColor(.systemIndigo, for: .normal)
    button.backgroundColor = .none
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    setupHierarchy()
    setupLayout()
  }
  
  // MARK: - Setup Hierarchy
  
  private func setupHierarchy() {
    view.addSubview(backgroundView)
    backgroundView.addSubview(titleLabel)
    backgroundView.addSubview(loginTextField)
    backgroundView.addSubview(passwordTextField)
    backgroundView.addSubview(loginButton)
    backgroundView.addSubview(forgotButton)
    backgroundView.addSubview(dividerLeftView)
    backgroundView.addSubview(dividerRightView)
    backgroundView.addSubview(connectLabel)
    backgroundView.addSubview(facebookButton)
    backgroundView.addSubview(twitterButton)
    backgroundView.addSubview(signUpLabel)
    backgroundView.addSubview(signUpButton)
  }
  
  // MARK: - Setup Layout
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor,
                                      constant: 40),
      titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
      
      loginTextField.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor,
                                          constant: 40),
      loginTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                              constant: 40),
      loginTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                               constant: -40),
      loginTextField.heightAnchor.constraint(equalToConstant: 45),
      
      passwordTextField.topAnchor.constraint(equalTo:  loginTextField.bottomAnchor,
                                             constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                 constant: 40),
      passwordTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                  constant: -40),
      passwordTextField.heightAnchor.constraint(equalToConstant: 45),
      
      loginButton.topAnchor.constraint(equalTo:  passwordTextField.bottomAnchor,
                                       constant: 40),
      loginButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                           constant: 40),
      loginButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                            constant: -40),
      loginButton.heightAnchor.constraint(equalToConstant: 45),
      
      forgotButton.topAnchor.constraint(equalTo:  loginButton.bottomAnchor,
                                        constant: 16),
      forgotButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
      
      dividerLeftView.topAnchor.constraint(equalTo:  forgotButton.bottomAnchor,
                                           constant: 220),
      dividerLeftView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                               constant: 20),
      dividerLeftView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                constant: -260),
      dividerLeftView.heightAnchor.constraint(equalToConstant: 1),
      
      dividerRightView.topAnchor.constraint(equalTo:  forgotButton.bottomAnchor,
                                            constant: 220),
      dividerRightView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                constant: 260),
      dividerRightView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                 constant: -20),
      dividerRightView.heightAnchor.constraint(equalToConstant: 1),
      
      connectLabel.bottomAnchor.constraint(equalTo:  dividerLeftView.bottomAnchor,
                                           constant: 7),
      connectLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
      
      facebookButton.topAnchor.constraint(equalTo:  connectLabel.bottomAnchor,
                                          constant: 16),
      facebookButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                              constant: 25),
      facebookButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                               constant: -220),
      facebookButton.heightAnchor.constraint(equalToConstant: 35),
      
      twitterButton.topAnchor.constraint(equalTo:  connectLabel.bottomAnchor,
                                         constant: 16),
      twitterButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                             constant: 220),
      twitterButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                              constant: -25),
      twitterButton.heightAnchor.constraint(equalToConstant: 35),
      
      signUpLabel.topAnchor.constraint(equalTo:  facebookButton.bottomAnchor,
                                       constant: 30),
      signUpLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                           constant: 110),
      
      signUpButton.centerYAnchor.constraint(equalTo:  signUpLabel.centerYAnchor,
                                            constant: -1),
      signUpButton.leadingAnchor.constraint(equalTo:  signUpLabel.trailingAnchor,
                                            constant: 6),
    ])
  }
  
  // MARK: - Actions
  
  @objc func loginButtonTapped() {
    if loginButton.title(for: .normal) == "Login" {
      loginButton.setTitle("Logging...", for: .normal)
    } else {
      loginButton.setTitle("Login", for: .normal)
    }
  }
  
  @objc private func fbButtonTapped() {
    openURL("https://www.facebook.com")
  }
  
  @objc private func twitterButtonTapped() {
    openURL("https://www.twitter.com")
  }
  
  private func openURL(_ urlString: String) {
    guard let url = URL(string: urlString) else {
      showAlert(title: "Ошибка", message: "Некорректный URL")
      return
    }
    
    UIApplication.shared.open(url, options: [:]) { success in
      if !success {
        self.showAlert(title: "Ошибка", message: "Не удалось открыть страницу")
      }
    }
  }
  
  private func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    present(alert, animated: true)
  }
}
