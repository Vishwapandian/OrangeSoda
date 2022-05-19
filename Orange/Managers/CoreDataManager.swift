//
//  CoreDataManager.swift
//  schedule
//
//  Created by Vishwa Pandian on 4/2/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ScheduleDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription )")
            }
        }
    }
    
    func saveEvent(name: String, date: Date, repeats: Bool, length: Int16, anytime: Bool, time: Float, selectedTime: Date) {
        
        let event = Event(context: persistentContainer.viewContext)
        
        event.name = name
        event.date = date
        event.repeats = repeats
        event.length = length
        event.anytime = anytime
        event.time = time
        event.selectedTime = selectedTime
        
        do {
            try persistentContainer.viewContext .save()
        } catch {
            print("Failed to save \(error)")
        }
    }
    
    func getAllEvents() -> [Event] {
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func deleteEvent(event: Event) {
        
        persistentContainer.viewContext.delete(event)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to delete: \(error)")
        }
        
    }
    
    func updateEvent() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
}
