//
//  Education.swift
//  Miel
//
//  Created by admin on 10/12/2024.
//

import Foundation

struct Education {
    var id: UUID = UUID()
    var title: String
    var color: String
    var stage: Stage
    static let mocData: [Education] = [
        .init(title: "Введение в профессию риелтор", color: "Turquoise", stage: .notStarted),
        .init(title: "Базовый юредический курс", color: "CstomYellow", stage: .notStarted),
        .init(title: "Курс \"Ипотека\"", color: "Violet", stage: .notStarted),
        .init(title: "Курс \"Налогооблажение\"", color: "Lime", stage: .notStarted)
        ]
    enum Stage: String, CaseIterable {
        case notStarted = "не начат"
        case inProgress = "в процессе"
        case passed = "пройден"
    }
}
