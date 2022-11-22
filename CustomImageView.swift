import UIKit

final class CustomImageView: UIImageView {
    
    let progressIndicatorView = CircularLoaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        progressIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(progressIndicatorView)
    }
}
extension CustomImageView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            progressIndicatorView.widthAnchor.constraint(equalTo: widthAnchor),
            progressIndicatorView.heightAnchor.constraint(equalTo: heightAnchor),
            progressIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
