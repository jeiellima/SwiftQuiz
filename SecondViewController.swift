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
    var questionButton: UIButton!
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
        
        questionButton = UIButton()
        questionButton.translatesAutoresizingMaskIntoConstraints = false
        questionButton.setTitle("button", for: .normal)
        questionButton.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
        questionButton.frame = CGRect(x:0, y:400, width: screenSize.width, height: 75)
        questionButton.setTitleColor(.white, for: .normal)
        view.addSubview(questionButton)
        
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
}
