import UIKit

final class LoginBackgroundView: UIView {
  
  private lazy var whiteBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var topImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "Vector 1")
    view.contentMode = .scaleToFill
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var bottomImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "Vector 2")
    view.contentMode = .scaleToFill
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHierarchy()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupHierarchy() {
    addSubview(whiteBackgroundView)
    whiteBackgroundView.addSubview(bottomImageView)
    whiteBackgroundView.addSubview(topImageView)
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      whiteBackgroundView.topAnchor.constraint(equalTo: topAnchor),
      whiteBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      whiteBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      whiteBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      bottomImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor,
                                           constant: -104),
      bottomImageView.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor),
      bottomImageView.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor),
      bottomImageView.heightAnchor.constraint(equalToConstant: 94),
      
      topImageView.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor),
      topImageView.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor),
      topImageView.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor),
      topImageView.heightAnchor.constraint(equalToConstant: 520)
    ])
  }
}

