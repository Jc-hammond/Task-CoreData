//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Connor Hammond on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotestextField: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotestextField.text, !notes.isEmpty else {return}
        let date = taskDueDatePicker.date
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    //MARK: - Functions
    func updateView(){
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotestextField.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
    

}//End of class
