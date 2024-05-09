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
        iv.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iv)
        iv.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2).isActive = true
        iv.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return iv
    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = .gray
        ai.hidesWhenStopped = true
        ai.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ai)
        ai.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        ai.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return ai
    }
    
    func makeTitleLabel() -> UILabel {
        let l = makeLabel(size: 20)
        l.font = .boldSystemFont(ofSize: 20)
        l.numberOfLines = 0
        l.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1).isActive = true
        l.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return l
    }
    
    func makeDescriptionLabel() -> UILabel {
        let l = makeLabel(size: 14)
        l.numberOfLines = 0
        l.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1).isActive = true
        l.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return l
    }
    
    func makeLabel(size: CGFloat) -> UILabel {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: size)
        addSubview(l)
        return l
    }
}
