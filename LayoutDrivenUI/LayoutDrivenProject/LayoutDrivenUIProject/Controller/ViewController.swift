//
//  ViewController.swift
//  LayoutDrivenUIProject
//
//  Created by 김우성 on 2021/06/06.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Prperty
    
    private let label = LayoutDrivenView()
    
    private let animationLabel = LayoutDrivenView()
    
    private let slider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 1
        slider.minimumValue = 0
        slider.addTarget(self, action: #selector(sliderValueDidChanged), for: .valueChanged)
        return slider
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    //MARK: - Action
    
    @objc func sliderValueDidChanged(sender: UISlider) {
        
        label.text = "\(sender.value)"
        label.fontSize = CGFloat(sender.value * 36)
    }
    
    //MARK: - Helper
    
    func setupLayout() {
        
        view.addSubview(label)
        label.backgroundColor = .lightGray
        label.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.leftAnchor)
        
        view.addSubview(slider)
        slider.centerX(inView: view)
        slider.centerY(inView: view)
        slider.setDimensions(height: 44,
                             width: view.frame.width)
        
        view.addSubview(animationLabel)
        animationLabel.centerX(inView: view)
        animationLabel.anchor(top: slider.bottomAnchor)
        animationLabel.text = "Hellow UIKit"
        animationLabel.fontSize = 30
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: .beginFromCurrentState) { 
            self.view.layoutIfNeeded()
        } completion: { _ in
            //
        }

    }
    


}

