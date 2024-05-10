//
//  TestView.swift
//  MVVM+Data Driven UI
//
//  Created by Vitaliy Halai on 9.05.24.
//

import UIKit
import SnapKit

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
            setupConstraints()
            update(viewData: nil, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .loading(let data):
            update(viewData: data, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .success(let data):
            update(viewData: data, isHidden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .failure(let data):
            update(viewData: data, isHidden: false)
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

extension TestView {
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.height.equalTo(80)
            $0.top.equalToSuperview().offset(8)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalTo(imageView.snp.bottom).offset(8)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalTo(imageView.snp.bottom).offset(32)
            //$0.leading.equalToSuperview().offset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
           // $0.leading.equalToSuperview().offset(16)
        }
        
    }
}
