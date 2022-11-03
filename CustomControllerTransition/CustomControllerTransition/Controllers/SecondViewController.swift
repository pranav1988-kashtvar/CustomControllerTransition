//
//  SecondViewController.swift
//  CustomControllerTransition
//
//  Created by Shi Pra on 02/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var btnFrame: CGRect!
    
    lazy var showControllerBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupDismissBtn()
    }
    
    override func viewDidLayoutSubviews() {
        showControllerBtn.layer.cornerRadius = showControllerBtn.frame.size.width / 2
        showControllerBtn.layer.shadowRadius = 5
        showControllerBtn.layer.shadowColor = UIColor.black.cgColor
        showControllerBtn.layer.shadowOpacity = 0.5
    }
    
    func setupDismissBtn() {
        view.addSubview(showControllerBtn)
        showControllerBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: btnFrame.minY).isActive = true
        showControllerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: btnFrame.minX).isActive = true
        showControllerBtn.widthAnchor.constraint(equalToConstant: btnFrame.size.width).isActive = true
        showControllerBtn.heightAnchor.constraint(equalTo: showControllerBtn.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
