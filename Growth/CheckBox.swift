

import UIKit


class CheckBox: UIButton {
    // Images
    let uncheckedImage = UIImage(systemName: "square")
    let checkedImage = UIImage(systemName: "checkmark.square.fill")
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    // Check the event
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpOutside)
        self.isChecked = false
    }
        
     
    @objc func buttonClicked(sender: UIButton) {
//        if sender == self {
//            isChecked = !isChecked
//        }
        
        isChecked.toggle()
        sendActions(for: .valueChanged)
    }
}
