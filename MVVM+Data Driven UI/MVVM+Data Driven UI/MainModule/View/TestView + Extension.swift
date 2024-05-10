//
//  TestView + Extension.swift
//  MVVM+Data Driven UI
//
//  Created by Vitaliy Halai on 9.05.24.
//

import UIKit

extension TestView {
    
    func makeImageView() -> UIImageView {
        let iv = UIImageView()
        addSubview(iv)
        return iv
    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = .gray
        ai.hidesWhenStopped = true
        
        addSubview(ai)
        return ai
    }
    
    func makeTitleLabel() -> UILabel {
        let l = makeLabel(size: 20)
        l.font = .boldSystemFont(ofSize: 20)
        l.numberOfLines = 0
        return l
    }
    
    func makeDescriptionLabel() -> UILabel {
        let l = makeLabel(size: 14)
        l.numberOfLines = 0
        return l
    }
    
    func makeLabel(size: CGFloat) -> UILabel {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: size)
        addSubview(l)
        return l
    }
}
