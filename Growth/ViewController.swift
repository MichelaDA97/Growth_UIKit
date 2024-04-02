//
//  ViewController.swift
//  Growth
//
//  Created by Michela D'Avino on 25/03/24.
//

import UIKit
import SwiftUI

class ViewController: UITableViewController {
    
    // Segue is used when + is tapped
    @IBSegueAction func segueToAddActivity(_ coder: NSCoder) -> UIViewController? {
        
        //        return UIHostingController(coder: coder, rootView: AddActivity())
        
        var addActivityView = AddActivity()
        
        // To save the activity from SwiftUI in UIKit
        addActivityView.completionHandler = { [weak self] activity in
            self?.addActivity(activity)
        }
        
        return UIHostingController(coder: coder, rootView: addActivityView)
    }
    
    
    func addActivity(_ activity: Activities) {
        sampleActivity.append(activity)
        saveActivities()
        tableView.reloadData()
    }
    
    
    // Function to save activities to UserDefaults
    func saveActivities() {
        let activitiesData = try? NSKeyedArchiver.archivedData(withRootObject: sampleActivity, requiringSecureCoding: false)
        UserDefaults.standard.set(activitiesData, forKey: "activities")
    }
    
    // Function to load activities from UserDefaults
    func loadActivities() {
        if let activitiesData = UserDefaults.standard.data(forKey: "activities"),
           let activities = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(activitiesData) as? [Activities] {
            sampleActivity = activities
            tableView.reloadData()
        }
    }
    
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        // create the alert
        let alert = UIAlertController(title: "Delete items", message: "Do you want delete all the activities?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {
            action in
            sampleActivity.removeAll()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load activities when the view loads
        loadActivities()
        
        
        // Displays an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.title = "Daily Routine"
    }
    
    // MARK: - Table view data source
    
    // Specifies the number of sections in the UITableView.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Returns 1 indicating that the table view will have a single section.
        return 1
    }
    
    // Specifies the number of rows in a given section of the UITableView.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returns the total number of mentors, thereby setting the number of rows in the table view.
        return sampleActivity.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityTableViewCell
        
        let index = indexPath.row
        let activities = sampleActivity[index]
        //        cell.textLabel?.text = activities.text
        cell.update(with: activities)
        
        
        
        return cell
    }
    
    // check list alternative
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
    //            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
    //        } else {
    //            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
    //        }
    //    }
    
    // Overrides the method to specify the height for each row in the table view.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Returns a fixed height of 80.0 points for each row.
        60.0
    }
    
    
    
    // Ask the data source to commit the insertion or deletion of a specified row in the receiver.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            sampleActivity.remove(at: indexPath.row)
            saveActivities()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Tell the data source to move a row at a specific location in the table view to another location.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedActivity = sampleActivity.remove(at: fromIndexPath.row)
        sampleActivity.insert(movedActivity, at: to.row)
    }
    
    // Ask the delegate for the editing style of a row at a particular location in a table view.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
}

