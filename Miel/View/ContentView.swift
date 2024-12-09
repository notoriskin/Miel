//
//  ContentView.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentDay: Date = Date()
    var body: some View {
        NavigationStack {
            TabBarView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            //
                        } label: {
                            Image(.notification)
                                .frame(width: 16, height: 16)
                                .overlay {
                                    Circle()
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                        .frame(width: 32,height: 32)
                                        .foregroundStyle(.bordo)
                                }
                        }
                        
                    }
                    
                    ToolbarItem(placement: .principal) {
                        VStack(alignment: .leading) {
                            Text("Привет, Колесникова Мария")
                                .font(.custom("PT Sans", size: 12))
                            Text("\(currentDay.format("EEEE")), \(currentDay.format("d MMMM YYYY")) года")
                                .font(.custom("PT Sans", size: 12))
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36,height: 36)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
