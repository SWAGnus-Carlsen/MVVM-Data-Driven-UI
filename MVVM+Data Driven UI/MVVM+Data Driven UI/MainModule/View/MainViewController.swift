//
//  MainViewController.swift
//  MVVM+Data Driven UI
//
//  Created by Vitaliy Halai on 9.05.24.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol
    private var testView = TestView()
    
     init() {
        // this viewModel gonna be hardcoded for time saving, but there was a better way to initialize this by using DI
        viewModel = MainViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createView()
        updateUI()
        createButton()
    }

    private func createView() {
        testView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func updateUI() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
        
    }
    
    private func createButton() {
        let button = UIButton()
        button.setTitle("Start Fetch", for: .normal)
        button.backgroundColor = .blue
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        button.center = view.center
        button.frame.origin.y += 300
        button.addTarget(self, action: #selector(fetchTapped), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func fetchTapped() {
        viewModel.startFetch()
    }
}

#Preview("") {
    MainViewController()
}
