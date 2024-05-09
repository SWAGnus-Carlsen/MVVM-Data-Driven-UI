//
//  MainViewModel.swift
//  MVVM+Data Driven UI
//
//  Created by Vitaliy Halai on 9.05.24.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> Void)?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        //start loading.....
        updateViewData?(.loading(ViewData.Data(icon: nil, 
                                               description: nil,
                                               title: nil,
                                               phoneNumber: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success",
                                                         description: "Super good",  title: "Awesome!",
                                                         phoneNumber: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                         description: "Error",
                                                         title: "Not real cool",
                                                         phoneNumber: nil)))
        }
    }
    
    
    
}
