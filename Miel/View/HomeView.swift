//
//  HomeView.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var title1: String = "Квоты"
    @State private var title2: String = "Кандидаты"
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                KvotView(title: $title1)
                    .frame(height: 62)
                    .frame(maxWidth: .infinity)
                KvotView(title: $title2)
                    .frame(height: 62)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            CalendarView()
            ScrollView {
                CandidateCard()
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
