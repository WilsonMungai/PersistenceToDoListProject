//
//  TaskViewController.swift
//  PersistanceToDoListProject
//
//  Created by Mungai on 2022-11-23.
//

import UIKit

class TaskViewController: UIViewController
{
    // Deletion Handler
    public var deletionHandler: (() -> Void)?
    
    @IBOutlet var taskLabel: UILabel!
    
    var task : String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskLabel.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask()
    {
        guard let count = UserDefaults().removeObject(forKey: "count") as? Int else
        {
            return
        }
        
        let newCount = count - 1
        
        UserDefaults().set(newCount,forKey: "count")
        
        // Save the tasks
        UserDefaults().set(taskLabel,forKey: "task_\(newCount)")
        
        deletionHandler?()
        
        navigationController?.popViewController(animated: true)
    }
  
}
