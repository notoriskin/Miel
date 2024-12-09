//
//  Tab.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case home
    case showcase
    case faworites
    case office
    
    var title: String {
        switch self {
        case .home: "Главная"
        case .showcase: "Витрина"
        case .faworites: "Избранное"
        case .office: "Офис"
        }
    }
    
    var imageName: String {
        switch self {
        case .home: "home"
        case .showcase: "showcase"
        case .faworites: "favorite"
        case .office: "office"
        }
    }
    
    var imageNameActive: String {
        switch self {
        case .home: "activeHome"
        case .showcase: "activeShowcase"
        case .faworites: "activeFavorite"
        case .office: "activeOffice"
        }
    }
}
