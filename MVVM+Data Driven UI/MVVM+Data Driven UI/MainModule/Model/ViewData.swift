//
//  ViewData.swift
//  MVVM+Data Driven UI
//
//  Created by Vitaliy Halai on 9.05.24.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let description: String?
        let title: String?
        let phoneNumber: String?
    }
}
