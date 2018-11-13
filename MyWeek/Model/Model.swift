//
//  Model.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/13/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import Foundation

class Model {
    
    struct Event {
        var id: Int
        var title: String
        var doDay: Weekdate
        var dueDay: Weekdate
    }
    
    enum Weekday {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
    }
    
    struct Weekdate {
        let day: Int
        let weekday: Weekday
        
        func weekdayAsString() -> String {
            switch weekday {
            case .Sunday: return "Sun"
            case .Monday: return "Mon"
            case .Tuesday: return "Tue"
            case .Wednesday: return "Wed"
            case .Thursday: return "Thu"
            case .Friday: return "Fri"
            case .Saturday: return "Sat"
            }
        }
    }
    
    var week: [Weekdate] = []
    
    private var events: [Event] = []
    
    init() {
        getEvents()
        getWeekDates()
    }
}

extension Model {
    
    private func getEvents() {
        for _ in 0...7 {
            let event = Event.init(id: 0, title: "Homework", doDay: Weekdate.init(day: 13, weekday: .Tuesday), dueDay: Weekdate.init(day: 4, weekday: .Saturday))
            events.append(event)
        }
    }
    
    func addEvent(event: Event) {
        events.append(event)
        // persist?
        // reload?
    }
    
    func getEventsFromDay(day: Int) -> [Event] {
        var events: [Event] = []
        for event in self.events {
            if (event.doDay.day == day) {
                events.append(event)
            }
        }
        return events
    }
    
    func getLabelViewsFromEvents(events: [Event]) -> [LabelView] {
        var labelViews: [LabelView] = []
        for event in events {
            let view = LabelView()
            view.upperLabel.text = event.title
            view.lowerLabel.text = event.dueDay.weekdayAsString()
            view.color = .orange
            labelViews.append(view)
        }
        return labelViews
    }
    
    private func getWeekDates() {
        // order todays date as 3rd Row!
        var date = Date()
        for _ in 0...6 {
            let day = Calendar.current.component(.day, from: date)
            let weekdayInt = Calendar.current.component(.weekday, from: date)
            let weekday: Weekday
            switch weekdayInt {
            case 1: weekday = .Sunday
            case 2: weekday = .Monday
            case 3: weekday = .Tuesday
            case 4: weekday = .Wednesday
            case 5: weekday = .Thursday
            case 6: weekday = .Friday
            case 7: weekday = .Saturday
            default: weekday = .Monday
            }
            let weekdate = Weekdate.init(day: day, weekday: weekday)
            week.append(weekdate)
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            // WRAP OPTIONAL?!
        }
    }
}

