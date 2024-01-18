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
    
    var totalCorrectAnswers = QuizManager.shared.totalCorrectAnswers
    var totalAnswers = QuizManager.shared.totalAnswers
    
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
        answersLabel.text = "Perguntas respondidas: \(totalAnswers)"
        answersLabel.font = .systemFont(ofSize: 20)
        answersLabel.textColor = .black
        view.addSubview(answersLabel)
        
        correctAnswerLabel = UILabel()
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        correctAnswerLabel.text = "Respostas corretas: \(totalCorrectAnswers)"
        correctAnswerLabel.textColor = UIColor(red: 0.0/255.0, green: 125.0/255.0, blue: 0.0/255.0, alpha: 1)
        correctAnswerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(correctAnswerLabel)
        
        wrongAnswerLabel = UILabel()
        wrongAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswerLabel.text = "Respostas erradas: \(totalAnswers - totalCorrectAnswers)"
        wrongAnswerLabel.textColor = UIColor(red: 225.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        wrongAnswerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(wrongAnswerLabel)
        
        let score = totalAnswers != 0 ? (totalCorrectAnswers * 100 / totalAnswers) : 0
        percentAnswerLabel = UILabel()
        percentAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        percentAnswerLabel.text = "\(score)%"
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
        restartButton.tag = 1
        restartButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(restartButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            resultTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
            answersLabel.topAnchor.constraint(equalTo: resultTitleLabel.bottomAnchor, constant: 40),
            answersLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),

            correctAnswerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            correctAnswerLabel.topAnchor.constraint(equalTo: answersLabel.bottomAnchor, constant: 20),

            wrongAnswerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            wrongAnswerLabel.topAnchor.constraint(equalTo: correctAnswerLabel.bottomAnchor, constant: 20),
            
            percentAnswerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            percentAnswerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    @objc func close(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            let viewController = ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
        dismiss(animated: true, completion: nil)
    }
}
