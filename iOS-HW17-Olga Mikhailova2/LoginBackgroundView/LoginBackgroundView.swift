import UIKit

class LoginBackgroundView: UIView {
    // Настройки
    private let whiteAreaHeightRatio: CGFloat = 0.35 // Высота белой области (35%)
    private let waveHeight: CGFloat = 25             // Высота волны
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    
    private func setupLayers() {
        // Очищаем предыдущие слои
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        // 1. Основной градиентный фон
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.87, green: 0.77, blue: 0.99, alpha: 1.00).cgColor,
            UIColor(red: 0.57, green: 0.78, blue: 0.99, alpha: 1.00).cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        // 2. Белая область с волной
        let whiteLayer = CAShapeLayer()
        whiteLayer.fillColor = UIColor.white.cgColor
        whiteLayer.path = createWavePath()
        layer.addSublayer(whiteLayer)
        
        // 3. Градиент для плавного перехода
        let fadeLayer = CAGradientLayer()
        fadeLayer.colors = [
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.withAlphaComponent(1).cgColor
        ]
        fadeLayer.locations = [0.6, 1]
        fadeLayer.startPoint = CGPoint(x: 0.5, y: 0)
        fadeLayer.endPoint = CGPoint(x: 0.5, y: 1)
        fadeLayer.frame = CGRect(
            x: 0,
            y: bounds.height * (1 - whiteAreaHeightRatio) - waveHeight,
            width: bounds.width,
            height: waveHeight * 2
        )
        layer.addSublayer(fadeLayer)
    }
    
    private func createWavePath() -> CGPath {
        let path = UIBezierPath()
        let startY = bounds.height * (1 - whiteAreaHeightRatio)
        
        // Начало пути
        path.move(to: CGPoint(x: 0, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: startY))
        
        // Волна
        path.addCurve(
            to: CGPoint(x: bounds.width, y: startY),
            controlPoint1: CGPoint(x: bounds.width * 0.3, y: startY - waveHeight),
            controlPoint2: CGPoint(x: bounds.width * 0.7, y: startY + waveHeight)
        )
        
        // Завершение
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.close()
        
        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayers()
    }
}
