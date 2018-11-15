//
//  Model.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/13/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import Foundation

class Model {
    
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
    
    struct Event {
        var id: Int
        var title: String
        var doDay: Int
        var dueDay: Int
    }
    
    private var week: [Weekdate] = []
    
    private var events: [Event] = []
    
    init() {
        getEvents()
        getWeekdates()
    }
}

extension Model {
    
    func addEvent(event: Event) {
        events.append(event)
        // persist?
        // reload?
    }
    
    func deleteEvent(id: Int) {
        
    }
    
    func replaceEvent(with id: Int, with replacement: Event) {
        
    }
}

extension Model {
    
    private func getEvents() {
        for _ in 0...7 {
            let event = Event.init(id: 0, title: "Homework", doDay: 16, dueDay: 18)
            events.append(event)
        }
    }
    
    private func getEventsFromDay(day: Int) -> [Event] {
        var events: [Event] = []
        for event in self.events {
            if (event.doDay == day) {
                events.append(event)
            }
        }
        return events
    }
    
    private func getLabelViewsFromEvents(events: [Event]) -> [LabelView] {
        var labelViews: [LabelView] = []
        for event in events {
            let view = LabelView()
            view.upperLabel.text = event.title
            view.lowerLabel.text = String(event.dueDay)
            view.color = .orange
            labelViews.append(view)
        }
        return labelViews
    }
    
    private func getWeekdates() {
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

