//
//  Date+Ext.swift
//  Miel
//
//  Created by admin on 9/12/2024.
//

import Foundation

extension Date {
    //MARK: Свойства
    // Совпадение дня
    var isToday: Bool { Calendar.current.isDateInToday(self) }
    // Совпадение часа
    var isTheSameHour: Bool {
        // Сравниваем дату к которой применяем свойство с текущей датой
        Calendar.current.compare(self, to: Date(), toGranularity: .hour) == .orderedSame // тот же самый порядок
    }
    // Прошлый ли день
    var isPast: Bool {
        Calendar.current.compare(self, to: Date(), toGranularity: .hour) == .orderedAscending
    }
    // Будет или прошло
    var isFuture: Bool {
        Calendar.current.compare(self, to: Date(), toGranularity: .hour) == .orderedDescending
    }
    //MARK: Методы
    // Формат даты в строку
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    // Получить неделю
    func fetchWeek(_ date: Date = Date()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date)
        var week: [WeekDay] = []
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        // проверяем сможем ди получить начало недели
        guard let startOfWeek = weekForDate?.start else { return week }
        
        (0..<7).forEach { index in
            if let weekDayDate = calendar.date(byAdding: .day, value: index , to: startOfWeek) {
                week.append(WeekDay(date: weekDayDate))
            }
        }
        return week
    }
    // Создать следующую неделю
    func createNextWeek() -> [WeekDay] {
        // Создаем календарь
        let calendar = Calendar.current
        // Создаем дату
        let startOfDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfDate) else {  return [] }
        return fetchWeek(nextDate)
    }
    // Создать предыдущую неделю
    func createPreviousWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfDate) else {  return [] }
        return fetchWeek(previousDate)
    }
    
    // Структура День
    struct WeekDay: Identifiable, Equatable {
        var id: UUID = UUID()
        var date: Date
    }
}
