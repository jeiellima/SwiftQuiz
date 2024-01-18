//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Jeiel Lima on 19/12/23.
//

import UIKit

class ViewController: UIViewController {
    var firstScreenImage: UIImageView!
    var startButton: UIButton!
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstScreen()
        setupConstraints()
    }
        
    func firstScreen() {
        firstScreenImage = UIImageView()
        firstScreenImage.translatesAutoresizingMaskIntoConstraints = false
        firstScreenImage.backgroundColor = .blue
        firstScreenImage = UIImageView(image: UIImage(named: "LaunchScreen")!)
        firstScreenImage.frame = CGRect(x:0, y:0, width: screenSize.width, height: screenSize.height)
        firstScreenImage.contentMode = .scaleAspectFill
        view.addSubview(firstScreenImage)

        startButton = UIButton()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Começar", for: .normal)
        startButton.setTitleColor(.orange, for: .normal)
        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.6
        startButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        startButton.layer.shadowRadius = 6.0
        startButton.tag = 1
        view.addSubview(startButton)
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
//            firstScreenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            firstScreenImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            firstScreenImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            firstScreenImage.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 110),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            let quizViewController = QuizViewController()
            navigationController?.pushViewController(quizViewController, animated: true)
        }
    }
}
