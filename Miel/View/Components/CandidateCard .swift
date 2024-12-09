//
//  CandidateCard .swift
//  Miel
//
//  Created by admin on 10/12/2024.
//

import SwiftUI

struct CandidateCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .fill(.secondary)
            VStack(alignment: .leading,spacing: 10) {
                HStack {
                    RoundedRectangle(cornerRadius: 0)
                    //.resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                    VStack(alignment: .leading,spacing: 6) {
                        Text("Романова Мария Иванова")
                            .font(.custom("PT Sans", size: 16))
                        HStack(spacing: 40) {
                            Text("22 года")
                                .font(.custom("PT Sans", size: 12))
                                .foregroundStyle(.secondary)
                            
                            Text("Москва")
                                .font(.custom("PT Sans", size: 12))
                                .foregroundStyle(.secondary)
                        }
                    }
                    Spacer()
                    Image("favoriteCandidate")
                }
                Text("Обучение в Миэль")
                    .font(.custom("PT Sans", size: 12))
                    .foregroundStyle(.customMagenta)
                    .padding(.bottom, 10)
                VStack(alignment: .leading) {
                    ForEach(Education.mocData, id: \.id) { progres in
                        HStack {
                            Rectangle()
                                .frame(width: 12,height: 12)
                                .foregroundColor(Color(progres.color))
                            Text(progres.title)
                                .font(.custom("PT Sans", size: 12))
                                .foregroundStyle(.black)
                            Text(progres.stage.rawValue)
                                .font(.custom("PT Sans", size: 12))
                                .foregroundStyle(.black)
                        }
                    }
                }
                Text("Достижения")
                    .font(.custom("PT Sans", size: 12))
                    .foregroundStyle(.customMagenta)
                    .padding(.top,10)
                HStack {
                    ForEach(1...2,id: \.self) { item in
                        Rectangle()
                            .frame(width: 12,height: 12)
                            .foregroundStyle(.customOrange)
                        Text("Объекты 5")
                            .font(.custom("PT Sans", size: 12))
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding(8)
        }
    }
}

#Preview {
    ContentView()
}
