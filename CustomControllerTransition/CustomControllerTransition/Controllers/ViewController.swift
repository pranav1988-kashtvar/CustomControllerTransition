//
//  ViewController.swift
//  CustomControllerTransition
//
//  Created by Shi Pra on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: View Properties
    let imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    lazy var showControllerBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("M", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(showSecondController), for: .touchUpInside)
        return button
    }()
    
    // MARK: Properties
    let transition = CircularTransition()
    
    // MARK: Initializer
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupImageView()
        setupButton()
    }
    
    override func viewDidLayoutSubviews() {
        showControllerBtn.layer.cornerRadius = showControllerBtn.frame.size.width / 2
        showControllerBtn.layer.shadowRadius = 5
        showControllerBtn.layer.shadowColor = UIColor.black.cgColor
        showControllerBtn.layer.shadowOpacity = 0.5
    }
    
    
    // MARK: Helper Methods
    func setupImageView() {
        view.addSubview(imageView)
        
        // SETUP IMAGE CONTRAINT
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    func setupButton() {
        view.addSubview(showControllerBtn)
        
        // SETUP BUTTON CONTRAINT
        showControllerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        showControllerBtn.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 22).isActive = true
        showControllerBtn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        showControllerBtn.heightAnchor.constraint(equalTo: showControllerBtn.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func showSecondController(_ sender: UIButton) {
        let controller = SecondViewController()
        controller.transitioningDelegate = self
        controller.btnFrame = showControllerBtn.frame
        controller.modalPresentationStyle = .custom
        self.present(controller, animated: true)
    }
}


// MARK: Implement UIViewControllerTransitionDelegate
extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = showControllerBtn.center
        transition.circleColor = showControllerBtn.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = showControllerBtn.center
        transition.circleColor = showControllerBtn.backgroundColor!
        
        return transition
    }
}
