//
//  LayoutDrivenView.swift
//  LayoutDrivenUIProject
//
//  Created by 김우성 on 2021/06/06.
//

import UIKit

class LayoutDrivenView: UIView {
    var text:String = "" {
        didSet {
            // SwiftUI의 @State와 비슷합니다.
            setNeedsLayout()
        }
    }
    
    var fontSize: CGFloat = 14 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.text = text
        textLabel.font = textLabel.font.withSize(fontSize)
    }
    
    func setupLayout() {
        
        self.addSubview(textLabel)
        textLabel.anchor(top: self.topAnchor,
                         left: self.leftAnchor,
                         bottom: self.bottomAnchor,
                         right: self.rightAnchor)
    }
}
