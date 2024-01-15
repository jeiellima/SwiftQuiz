import UIKit

class QuizViewController: UIViewController {
    
    var viTimer: UIView!
    var backDecorationView: UIView!
    var timeLabel: UILabel!
    var questionLabel: UILabel!
    var questionaryView: UIView!
    var answersButtonStack: UIStackView!
    
    let quizManager = QuizManager.shared
    let screenSize: CGRect = UIScreen.main.bounds
    let numberOfAnswers = 4
    var timeCounter = 60
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        quizManager.refreshQuiz()
        setupView()
        setupQuestionary()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startCountdown()
    }
    
    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(didUpdateTime),
                                     userInfo: nil,
                                     repeats: true)
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) {(sucess) in
            self.showResults()
        }
    }
        
    func setupView() {
        view.backgroundColor = .white
        backDecorationView = UIView()
        backDecorationView.translatesAutoresizingMaskIntoConstraints = false
        backDecorationView.backgroundColor = .systemGroupedBackground
        view.addSubview(backDecorationView)
        
        viTimer = UIView()
        viTimer.frame.size.width = view.frame.size.width
        viTimer.translatesAutoresizingMaskIntoConstraints = false
        viTimer.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
        view.addSubview(viTimer)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "tempo restante: \(timeCounter)"
        timeLabel.textColor = .black
        timeLabel.textAlignment = .left
        timeLabel.font = .systemFont(ofSize: 20)
        view.addSubview(timeLabel)
    }
    
    func setupQuestionary() {
        questionaryView = UIView()
        questionaryView.translatesAutoresizingMaskIntoConstraints = false
        questionaryView.backgroundColor = .white
        view.addSubview(questionaryView)
        
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = .systemFont(ofSize: 30)
        questionLabel.textAlignment = .center
        questionLabel.backgroundColor = .clear
        questionLabel.textColor = .black
        questionLabel.text = quizManager.question
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        
        answersButtonStack = UIStackView()
        answersButtonStack.axis = .vertical
        answersButtonStack.spacing = 10
        answersButtonStack.distribution = .fillEqually
        answersButtonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(answersButtonStack)
          
        for index in 0..<numberOfAnswers {
            let answerButton = UIButton()
            let answerTitle = quizManager.options[index]
            answerButton.translatesAutoresizingMaskIntoConstraints = false
            answerButton.setTitle(answerTitle, for: .normal)
            answerButton.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
            answerButton.setTitleColor(.white, for: .normal)
            answerButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
            answerButton.titleLabel?.numberOfLines = 0
            answerButton.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
            answerButton.layer.borderWidth = 1
            answerButton.layer.borderColor = UIColor.black.cgColor
            answerButton.tag = index
            NSLayoutConstraint.activate([answerButton.heightAnchor.constraint(equalToConstant: 30)])
            answersButtonStack.addArrangedSubview(answerButton)
        }
        
        NSLayoutConstraint.activate([
            viTimer.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            viTimer.heightAnchor.constraint(equalToConstant: 50),
            
            timeLabel.centerYAnchor.constraint(equalTo: viTimer.centerYAnchor),
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor),
            timeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            timeLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            timeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            questionaryView.topAnchor.constraint(equalTo: viTimer.bottomAnchor),
            questionaryView.leftAnchor.constraint(equalTo: view.leftAnchor),
            questionaryView.rightAnchor.constraint(equalTo: view.rightAnchor),
            questionaryView.widthAnchor.constraint(equalTo: view.widthAnchor),
            questionaryView.heightAnchor.constraint(equalToConstant: 360),
            
            questionLabel.centerYAnchor.constraint(equalTo: questionaryView.centerYAnchor),
            questionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            questionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            answersButtonStack.topAnchor.constraint(equalTo: questionaryView.bottomAnchor),
            answersButtonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            answersButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor),
            answersButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor),
            answersButtonStack.heightAnchor.constraint(equalTo: questionaryView.heightAnchor, constant: -100)
        ])
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        refreshQuizData()
    }
    
    func refreshQuizData() {
        questionLabel.text = quizManager.question
        for index in 0..<quizManager.options.count {
            if let button = answersButtonStack.arrangedSubviews[index] as? UIButton {
                let title = quizManager.options[index]
                button.setTitle(title, for: .normal)
            }
        }
    }
    
    func showResults() {
        let resultsViewController = ResultViewController()
        navigationController?.pushViewController(resultsViewController, animated: true)
    }

    
    @objc func didTapAnswerButton(sender: UIButton!) {
        print("Button tapped \(sender.tag)")
        quizManager.validateAnswer(index: sender.tag)
        getNewQuiz()
    }
    
    @objc func didUpdateTime() {
        if timeCounter > 0 {
            timeCounter -= 1
            timeLabel.text = "tempo restante: \(self.timeCounter)"
        } else {
            timer?.invalidate()
        }
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<QuizViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: QuizViewController

    init(_ builder: @escaping () -> QuizViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> QuizViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: QuizViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<QuizViewController>>) {
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
          QuizViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
#endif
