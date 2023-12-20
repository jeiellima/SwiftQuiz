//
//  SecondViewController.swift
//  SwiftQuiz
//
//  Created by Jeiel Lima on 20/12/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    var decorationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        decorationView = UIView()
        decorationView.translatesAutoresizingMaskIntoConstraints = false
        decorationView.frame = CGRect(x:0, y:30, width: 250, height: 100)
        decorationView.backgroundColor = UIColor(red: 225.0/255.0, green: 72.0/255.0, blue: 0.0/255.0, alpha: 1)
        view.addSubview(decorationView)
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
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
      Group {
          ForEach(deviceNames, id: \.self) { deviceName in
          UIViewControllerPreview {
            ViewController()
          }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
          .previewInterfaceOrientation(.portraitUpsideDown)
          ForEach(deviceNames, id: \.self) { deviceName in
              UIViewControllerPreview {
                  ViewController()
              }.previewDevice(PreviewDevice(rawValue: deviceName))
                  .previewDisplayName(deviceName)
          }
          .previewDevice("iPhone 11 Pro")
          .previewInterfaceOrientation(.portraitUpsideDown)
      }
  }
}
#endif
