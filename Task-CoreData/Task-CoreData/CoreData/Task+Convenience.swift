//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Connor Hammond on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String?, dueDate: Date?, isCompleted: Bool = false,context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
    
  
    
}//End of extension
