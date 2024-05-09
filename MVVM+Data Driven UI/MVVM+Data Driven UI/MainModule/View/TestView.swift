//
//  TestView.swift
//  MVVM+Data Driven UI
//
//  Created by Vitaliy Halai on 9.05.24.
//

import UIKit

class TestView: UIView {
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .loading(let data):
            update(viewData: data, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .success(let data):
            update(viewData: data, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .failure(let data):
            update(viewData: data, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
        
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        if let imageName = viewData?.icon {
            imageView.image = UIImage(named: imageName)
        }
        
        descriptionLabel.text = viewData?.description
        titleLabel.text = viewData?.title
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        imageView.isHidden = isHidden
    }
}
