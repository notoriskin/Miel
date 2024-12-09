//
//  View+Ext.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import SwiftUI

extension View {
    // Растягивание по всей ширине
    @ViewBuilder
    func hSpace(_ alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    // Растяшивание по высоте
    @ViewBuilder
    func vSpace(_ alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
