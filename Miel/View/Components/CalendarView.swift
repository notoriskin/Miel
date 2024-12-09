//
//  CalendarView.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import SwiftUI

struct CalendarView: View {
    // MARK: Свойства календаря
    @State private var currentDate: Date = .init()
    @State private var currentWeekIndex: Int = 1
    @State private var createWeek: Bool = true
    @State private var weekSlider = [[Date.WeekDay]]()
    
    // MARK: Cвойста View
    @Namespace private var animation
    @State private var showApproveView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
                .onAppear() {
                    let currentWeek = Date().fetchWeek()
                    if let firstDate = currentWeek.first?.date {
                        weekSlider.append(firstDate.createPreviousWeek())
                    }
                    weekSlider.append(currentWeek)
                    if let lastDate = currentWeek.last?.date {
                        weekSlider.append(lastDate.createNextWeek())
                    }
                }
            
        }
        
        
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("\(currentDate.format("E")),")
                Text(currentDate.format("MMMM"))
                Text(currentDate.format("d"))
            }
            .font(.custom("PT Sans", size: 18))
            .foregroundStyle(.black)
            .padding(.horizontal)
            HStack {
                Text(currentDate.format("MMMM"))
                Text(currentDate.format("YYYY"))
                Spacer()
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    Button {
                        //
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
                .tint(.black)
                
            }
            .font(.custom("PT Sans", size: 12))
            .foregroundStyle(.black)
            .padding(.horizontal)
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    WeekView(weekSlider[index])
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 100)
        }
        .hSpace(.leading)
    }
    
    
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { weekDay in
                VStack(spacing: 8) {
                    Text(weekDay.date.format("E"))
                        .font(.custom("PT Sans", size: 14))
                        .foregroundStyle(week[5] == weekDay || week[6] == weekDay ? .customOrange : .secondary)
                    Text(weekDay.date.format("d"))
                        .font(.custom("PT Sans", size: 14))
                        .frame(width: 36,height: 36)
                        .foregroundStyle(week[5] == weekDay || week[6] == weekDay ? .customOrange : .black)
                        .background {
                            if isSameDay(weekDay.date, currentDate) {
                                Rectangle()
                                    .fill(.lime)
                            } else {
                                
                            }
                            if weekDay.date.isToday {
                                Rectangle()
                                    .fill(.opaccityLime)
                            }
                        }
                }
                .hSpace(.center)
                .onTapGesture {
                    withAnimation {
                        currentDate = weekDay.date
                    }
                }
            }
        }
        .background {
            GeometryReader { proxy in
                let minX = proxy.frame(in: .global).minX
                
                Color
                    .clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 1 && createWeek {
                            paginateWeek()
                        }
                    }
            }
        }
    }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date,
               currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
        }
        
        if let lastDate = weekSlider[currentWeekIndex].last?.date,
           currentWeekIndex == weekSlider.count - 1 {
            weekSlider.append(lastDate.createNextWeek())
            currentWeekIndex = weekSlider.count - 2
        }
    }
    
}

#Preview {
    CalendarView()
}
