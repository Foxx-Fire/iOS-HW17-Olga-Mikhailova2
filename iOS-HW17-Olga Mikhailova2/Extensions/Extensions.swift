import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage, padding _: CGFloat = 10) {
        let iconView = UIImageView(frame: CGRect(x: 28,
                                                 y: 0,
                                                 width: 20,
                                                 height: 20))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .gray

        let iconContainerView = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: 60,
                                                     height: 20))
        iconContainerView.addSubview(iconView)

        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage, leftPadding: CGFloat = 10) {
        let iconView = UIImageView(frame: CGRect(x: leftPadding,
                                                 y: 0,
                                                 width: 20,
                                                 height: 20))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .gray

        let iconContainerView = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: 40,
                                                     height: 20))
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
