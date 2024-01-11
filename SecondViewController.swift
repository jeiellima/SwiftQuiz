//
//  SecondViewController.swift
//  SwiftQuiz
//
//  Created by Jeiel Lima on 20/12/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    var decorationView: UIView!
    var backDecorationView: UIView!
    var timeLabel: UILabel!
    var questionButton: [String] = []
    var questionLabel: UILabel!
    var questionaryView: UIView!


    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupQuestionary()
    }
        
    func setupView() {
        backDecorationView = UIView()
        backDecorationView.translatesAutoresizingMaskIntoConstraints = false
        backDecorationView.frame = CGRect(x:0, y:30, width: screenSize.width, height: 70)
        backDecorationView.backgroundColor = .systemGroupedBackground
        view.addSubview(backDecorationView)
        
        decorationView = UIView()
        decorationView.translatesAutoresizingMaskIntoConstraints = false
        decorationView.frame = CGRect(x:0, y:30, width: screenSize.width, height: 70)
        decorationView.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
        view.addSubview(decorationView)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.frame = CGRect(x:10, y:30, width: screenSize.width, height: 70)
        timeLabel.text = "tempo restante:"
        timeLabel.textColor = .white
        timeLabel.textAlignment = .left
        timeLabel.font = .systemFont(ofSize: 23)
        view.addSubview(timeLabel)
    }
    
    func setupQuestionary() {
        questionaryView = UIView()
        questionaryView.translatesAutoresizingMaskIntoConstraints = false
        questionaryView.frame = CGRect(x:0, y:400, width: screenSize.width, height: 350)
        questionaryView.backgroundColor = .lightGray
        view.addSubview(questionaryView)
        
        for index in 0...3 {
            questionButton.append("Button \(index)")
        }
        
        for (index, element) in questionButton.enumerated() {
            let oneButton: UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle("button", for: .normal)
                button.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
                button.frame = CGRect(x:0, y:400, width: screenSize.width, height: 75)
                button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                button.tag = index
                view.addSubview(button)
                return button
            }()
        }
        
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "Label"
        questionLabel.frame = CGRect(x:0, y:100, width: screenSize.width, height: 300)
        questionLabel.textAlignment = .center
        questionLabel.backgroundColor = .gray
        questionLabel.textColor = .black
        view.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped \(sender.tag)")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<SecondViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: SecondViewController

    init(_ builder: @escaping () -> SecondViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> SecondViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: SecondViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<SecondViewController>>) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone 11 Pro Max",
]

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
  static var previews: some View {
    ForEach(deviceNames, id: \.self) { deviceName in
      UIViewControllerPreview {
        SecondViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
#endif
