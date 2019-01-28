//
//  Model.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/13/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    enum Weekday
    {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
    }
    
    struct Weekdate
    {
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
    
    struct Event: Codable
    {
        var id: Int
        var title: String
        var doDay: Int
        var dueDay: Int
    }
    
    var week: [Weekdate] = []
    
    private var events: [Event] = []
    
    init()
    {
        fetchEvents()
        getWeekdates()
    }
}

extension Model {
    
    func addEvent(event: Event)
    {
        events.append(event)
        
        // save and reload
    }
    
    func deleteEvent(id: Int)
    {
        
    }
    
    func replaceEvent(with id: Int, with replacement: Event)
    {
        
    }
}

extension Model
{
    
    private func getEvents()
    {
        for _ in 0...7 {
            let event = Event.init(id: 0, title: "Homework", doDay: 16, dueDay: 18)
            events.append(event)
        }
    }
    
    func getEventsFromDay(day: Int) -> [Event]
    {
        var events: [Event] = []
        for event in self.events
        {
            if (event.doDay == day)
            {
                events.append(event)
            }
        }
        return events
    }
    
    func getLabelViewsFromEvents(events: [Event]) -> [LabelView]
    {
        var labelViews: [LabelView] = []
        for event in events
        {
            let view = LabelView()
            view.upperLabel.text = event.title
            view.lowerLabel.text = String(event.dueDay)
            view.color = .orange
            labelViews.append(view)
        }
        return labelViews
    }
    
    func getWeekdates()
    {
        // order todays date as 3rd Row!
        var date = Date()
        for _ in 0...6
        {
            let day = Calendar.current.component(.day, from: date)
            let weekdayInt = Calendar.current.component(.weekday, from: date)
            let weekday: Weekday
            switch weekdayInt
            {
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

extension Model
{
    private func getDocumentsURL() -> URL?
    {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            return url
        }
        else
        {
            return nil
        }
    }
    
    private func saveEvents()
    {
        if let fileURL = getDocumentsURL()?.appendingPathComponent("events.json")
        {
            
            let encoder = JSONEncoder()
            
            do
            {
                let data = try encoder.encode(self.events)
                try data.write(to: fileURL)
            }
            catch
            {
                fatalError("Could not write data to file")
            }
            
        } else {
            fatalError("Could not get fileURL")
        }
    }
    
    private func fetchEvents()
    {
        if let fileURL = getDocumentsURL()?.appendingPathComponent("events.json")
        {
            
            let decoder = JSONDecoder()
            
            do
            {
                let data = try Data(contentsOf: fileURL)
                self.events = try decoder.decode([Event].self, from: data)
                print("Printing Events...")
                print(self.events)
            }
            catch
            {
                fatalError("Could not fetch data from file")
            }
            
        }
        else
        {
            print("Could not locate events")
        }
    }
    
}

