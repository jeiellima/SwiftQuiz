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
    var percentAnswerLabel: UILabel!
    var restartButton: UIButton!
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        
        view.backgroundColor = .systemGroupedBackground
        resultTitleLabel = UILabel()
        resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultTitleLabel.text = "Resultado"
        resultTitleLabel.font = .boldSystemFont(ofSize: 40)
        view.addSubview(resultTitleLabel)
        
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.text = "Perguntas respondidas: 00"
        answersLabel.font = .systemFont(ofSize: 20)
        answersLabel.textColor = .black
        view.addSubview(answersLabel)
        
        correctAnswerLabel = UILabel()
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        correctAnswerLabel.text = "Respostas corretas: 00"
        correctAnswerLabel.textColor = UIColor(red: 0.0/255.0, green: 125.0/255.0, blue: 0.0/255.0, alpha: 1)
        correctAnswerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(correctAnswerLabel)
        
        wrongAnswerLabel = UILabel()
        wrongAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswerLabel.text = "Respostas erradas: 00"
        wrongAnswerLabel.textColor = UIColor(red: 225.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        wrongAnswerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(wrongAnswerLabel)
        
        percentAnswerLabel = UILabel()
        percentAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        percentAnswerLabel.text = "100%"
        percentAnswerLabel.font = .boldSystemFont(ofSize: 90)
        view.addSubview(percentAnswerLabel)
        
        restartButton = UIButton()
        restartButton.setTitle("Reiniciar", for: .normal)
        restartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        restartButton.setTitleColor(.white, for: .normal)
        restartButton.setTitleShadowColor(.black, for: .normal)
        restartButton.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
        restartButton.frame = CGRect(x: 60, y: 700, width: 300, height: 50)
        restartButton.layer.cornerRadius = 10
        view.addSubview(restartButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            resultTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            answersLabel.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 40),
            answersLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),

            correctAnswerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            correctAnswerLabel.topAnchor.constraint(equalTo: answersLabel.bottomAnchor, constant: 20),

            wrongAnswerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            wrongAnswerLabel.topAnchor.constraint(equalTo: correctAnswerLabel.bottomAnchor, constant: 20),
            
            percentAnswerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            percentAnswerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct UIViewControllerPreview<ResultViewController: UIViewController>: UIViewControllerRepresentable {
//    let viewController: ResultViewController
//
//    init(_ builder: @escaping () -> ResultViewController) {
//        viewController = builder()
//    }
//
//    // MARK: - UIViewControllerRepresentable
//    func makeUIViewController(context: Context) -> ResultViewController {
//        viewController
//    }
//
//    func updateUIViewController(_ uiViewController: ResultViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ResultViewController>>) {
//        return
//    }
//}
//#endif
//
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//let deviceNames: [String] = [
//    "iPhone 11 Pro Max",
//]
//
//@available(iOS 13.0, *)
//struct ViewController_Preview: PreviewProvider {
//  static var previews: some View {
//    ForEach(deviceNames, id: \.self) { deviceName in
//      UIViewControllerPreview {
//        ResultViewController()
//      }.previewDevice(PreviewDevice(rawValue: deviceName))
//        .previewDisplayName(deviceName)
//    }
//  }
//}
//#endif
