//
//  KvotView.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import SwiftUI

struct KvotView: View {
    @Binding var title: String
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .fill(.lime)
                    .hSpace(.leading)
                    .vSpace()
                Text(title)
                    .font(.custom("PT Sans", size: 14))
            }
        }
    }
}

#Preview {
    KvotView(title: .constant("Квоты"))
}
