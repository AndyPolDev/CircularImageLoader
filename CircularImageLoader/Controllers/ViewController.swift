import UIKit

class ViewController: UIViewController {
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Download and present", for: .normal)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(srartButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        
        setViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        startButton.layer.cornerRadius = 10
    }
    
    private func setViews() {
        view.addView(startButton)
    }
    
    @objc private func srartButtonPressed() {
        print("Hello")
    }
}

//MARK: - Set Constraints

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
