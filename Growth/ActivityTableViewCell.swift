//
//  ActivityTableViewCell.swift
//  Growth
//
//  Created by Michela D'Avino on 26/03/24.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textActivity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    
    func update(with sampleActivities : Activities) {
        textActivity.text = sampleActivities.text
    }
}


