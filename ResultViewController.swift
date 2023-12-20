//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Jeiel Lima on 20/12/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultTitleLabel: UILabel!
    var answersLabel: UILabel!
    var correctAnswerLabel: UILabel!
    var wrongAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        
        view.backgroundColor = .lightGray
        resultTitleLabel = UILabel()
        resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultTitleLabel.text = "Resultado"
        resultTitleLabel.font = .boldSystemFont(ofSize: 40)
        view.addSubview(resultTitleLabel)
        
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.text = "Perguntas respondidas: 00"
        answersLabel.font = .systemFont(ofSize: 20)
        view.addSubview(answersLabel)
        
        correctAnswerLabel = UILabel()
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        correctAnswerLabel.text = "Respostas corretas: 00"
        correctAnswerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(correctAnswerLabel)
        
        wrongAnswerLabel = UILabel()
        wrongAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswerLabel.text = "Respostas erradas: 00"
        wrongAnswerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(wrongAnswerLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            resultTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            answersLabel.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 25),
            answersLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),

            correctAnswerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            correctAnswerLabel.topAnchor.constraint(equalTo: answersLabel.bottomAnchor, constant: 10),

            wrongAnswerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            wrongAnswerLabel.topAnchor.constraint(equalTo: correctAnswerLabel.bottomAnchor, constant: 10),
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ResultViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ResultViewController

    init(_ builder: @escaping () -> ResultViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ResultViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ResultViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ResultViewController>>) {
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
        ResultViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
#endif
