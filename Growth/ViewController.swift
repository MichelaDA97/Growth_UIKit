//
//  ViewController.swift
//  Growth
//
//  Created by Michela D'Avino on 25/03/24.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
        return cell
    }
    
    
    // Overrides the method to specify the height for each row in the table view.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Returns a fixed height of 80.0 points for each row.
        80.0
    }
}

