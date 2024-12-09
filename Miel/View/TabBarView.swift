//
//  TabView.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var activeTab: Tab = .home
    
    var body: some View {
        TabView(selection: $activeTab) {
            HomeView()
                .tag(Tab.home)
                .toolbarVisibility(.hidden, for: .tabBar)
            ShowcaseView()
                .tag(Tab.showcase)
                .toolbarVisibility(.hidden, for: .tabBar)
            FavoritesView()
                .tag(Tab.faworites)
                .toolbarVisibility(.hidden, for: .tabBar)
            OfficeView()
                .tag(Tab.office)
                .toolbarVisibility(.hidden, for: .tabBar)
        }
        .overlay(alignment: .bottom) {
            CustomTabBarItem()
        }
    }
    
    @ViewBuilder func CustomTabBarItem() -> some View {
        HStack(alignment: .center ,spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                VStack {
                    Image(activeTab == tab ? tab.imageNameActive : tab.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24,height: 24)
                    Text(tab.title)
                        .foregroundStyle(.white)
                        .font(.custom("PT Sans", size: 12))
                        .fontWeight(.regular)
                }
                .padding(.top)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        activeTab = tab
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(.bordo)
        }
    }
}

#Preview {
    TabBarView()
}



