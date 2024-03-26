//
//  ViewController.swift
//  Growth
//
//  Created by Michela D'Avino on 25/03/24.
//

import UIKit
import SwiftUI

class ViewController: UITableViewController {
    
    @IBSegueAction func segueToAddActivity(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: AddActivity())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Displays an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.title = "Personal Growth"
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

