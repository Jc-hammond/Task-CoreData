//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Connor Hammond on 4/27/21.
//

import CoreData
import Foundation

class TaskController {
    
    static var sharedInstance = TaskController()
    
    //SOT
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(task)
        
        CoreDataStack.saveContext()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?){
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    func fetchTask() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(tasks.count)
        self.tasks = tasks
    }
    
    func deleteTask(_ task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
    
    
    func toggleIsComplete(task: Task){
        task.isCompleted.toggle()
        CoreDataStack.saveContext()
    }
    
}//End of class
