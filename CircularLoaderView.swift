import UIKit

final class CircularLoaderView: UIView {
    
    private let circularPathLayer = CAShapeLayer()
    private let circularRadius: CGFloat = 20
    
    var progress: CGFloat {
        get {
            circularPathLayer.strokeEnd
        }
        set {
            if newValue > 1 {
                circularPathLayer.strokeEnd = 1
            } else if newValue < 0 {
                circularPathLayer.strokeEnd = 0
            } else {
                circularPathLayer.strokeEnd = newValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        progress = 0
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circularPathLayer.frame = bounds
        circularPathLayer.path = circularPath().cgPath
    }
    
    private func configure() {
        circularPathLayer.frame = bounds
        circularPathLayer.lineWidth = 7
        circularPathLayer.fillColor = UIColor.clear.cgColor
        circularPathLayer.strokeColor = UIColor.orange.cgColor
        layer.addSublayer(circularPathLayer)
    }
    
    private func circularFrame() -> CGRect {
        var circularFrame = CGRect(x: 0,
                                   y: 0,
                                   width: 2 * circularRadius,
                                   height: 2 * circularRadius)
        let circularPathBounds = circularPathLayer.bounds
        circularFrame.origin.x = circularPathBounds.midX - circularFrame.midX
        circularFrame.origin.y = circularPathBounds.midY - circularFrame.midY
        return circularFrame
    }
    
    private func circularPath() -> UIBezierPath {
        UIBezierPath(ovalIn: circularFrame())
    }
}
