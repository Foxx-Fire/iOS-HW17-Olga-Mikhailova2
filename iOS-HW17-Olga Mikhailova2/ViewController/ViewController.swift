
import UIKit

class ViewController: UIViewController {
    
    // MARK: Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        textField.layer.cornerRadius = 20
        textField.borderStyle = .none
        textField.setLeftIcon(UIImage(systemName: "person") ?? UIImage())
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 20
        button.addShadow()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let forgotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .none
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dividerLeftView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dividerRightView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let connectLabel: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let facebookButton: UIButton = {
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
        config.image = UIImage(named: "facebook")?.withTintColor(.white).resized(to: CGSize(width: 24, height: 24))
        config.imagePadding = 8 // Отступ между иконкой и текстом
        config.imagePlacement = .leading
        //        config.preferredSymbolConfigurationForImage // видимо ток для SF Symbols...не работает
        //        = UIImage.SymbolConfiguration(pointSize: 26, weight: .regular)
        config.contentInsets = NSDirectionalEdgeInsets( // Внутренние отступы кнопки
            top: 5, leading: 12, bottom: 5, trailing: 20
        )
        config.imageColorTransformer
        
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let twitterButton: UIButton = {
        let button = UIButton(type: .custom)
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemCyan
        config.title = "Twitter"
        config.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            return outgoing
        }
        config.image = UIImage(named: "twitter")?.withTintColor(.white).resized(to: CGSize(width: 26, height: 26))
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 5, leading: 12, bottom: 5, trailing: 20
        )
        
        button.configuration = config
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
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
  
        let backgroundView = LoginBackgroundView()
        backgroundView.frame = view.bounds
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
    }
    
    // MARK: SetupUI
    
    private func setupHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotButton)
        view.addSubview(dividerLeftView)
        view.addSubview(dividerRightView)
        view.addSubview(connectLabel)
        view.addSubview(facebookButton)
        view.addSubview(twitterButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
    }
    
    // MARK: Constraints
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            forgotButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            forgotButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dividerLeftView.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 220),
            dividerLeftView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividerLeftView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -260),
            dividerLeftView.heightAnchor.constraint(equalToConstant: 1),
            
            dividerRightView.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 220),
            dividerRightView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260),
            dividerRightView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dividerRightView.heightAnchor.constraint(equalToConstant: 1),
            
            connectLabel.bottomAnchor.constraint(equalTo: dividerLeftView.bottomAnchor, constant: 7),
            connectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            facebookButton.topAnchor.constraint(equalTo: connectLabel.bottomAnchor, constant: 16),
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -220),
            facebookButton.heightAnchor.constraint(equalToConstant: 35),
            
            twitterButton.topAnchor.constraint(equalTo: connectLabel.bottomAnchor, constant: 16),
            twitterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220),
            twitterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            twitterButton.heightAnchor.constraint(equalToConstant: 35),
            
            signUpLabel.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 30),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            
            signUpButton.centerYAnchor.constraint(equalTo: signUpLabel.centerYAnchor, constant: -1),
            signUpButton.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor, constant: 6)
        ])
    }
}

// MARK: - Extensions

extension UITextField {
    func setLeftIcon(_ image: UIImage, padding: CGFloat = 10) {
        let iconView = UIImageView(frame: CGRect(x: 28, y: 0, width: 20, height: 20))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .gray
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        iconContainerView.addSubview(iconView)
        
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ image: UIImage, leftPadding: CGFloat = 10) {
        let iconView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .gray
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        iconContainerView.addSubview(iconView)
        
        rightView = iconContainerView
        rightViewMode = .always
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UIButton {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}


/*
 var view = UIView()
 view.frame = CGRect(x: 0, y: 0, width: 376, height: 94)
 let layer0 = CAGradientLayer()
 layer0.colors = [
 UIColor(red: 0.651, green: 0.557, blue: 0.824, alpha: 1).cgColor,
 UIColor(red: 0.937, green: 0.733, blue: 0.91, alpha: 1).cgColor
 ]
 layer0.locations = [0, 1]
 layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
 layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
 layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.5, b: 0.17, c: -0.17, d: 8.33, tx: 0.59, ty: -3.34))
 layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
 layer0.position = view.center
 view.layer.addSublayer(layer0)
 
 view = UIView()
 view.frame = CGRect(x: 0, y: 0, width: 377, height: 512)
 let layer0 = CAGradientLayer()
 layer0.colors = [
 UIColor(red: 0.871, green: 0.769, blue: 0.988, alpha: 1).cgColor,
 UIColor(red: 0.569, green: 0.776, blue: 0.988, alpha: 1).cgColor
 ]
 layer0.locations = [0, 1]
 layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
 layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
 layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.99, b: 0.93, c: -0.93, d: 0.47, tx: 0.48, ty: -0.22))
 layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
 layer0.position = view.center
 view.layer.addSublayer(layer0)
 
 
 */

