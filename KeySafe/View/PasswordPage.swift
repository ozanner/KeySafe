//
//  PasswordPage.swift
//  KeySafe
//
//  Created by ozan on 6.02.2024.
//

import UIKit

class PasswordPage : UIViewController {
    
    @IBOutlet weak var enterPasswordTextField: UITextField!
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        enterPasswordTextField.isHidden = true
        textLabel.isHidden = true
        
        if userDefaults.object(forKey: "front") == nil {
            performSegue(withIdentifier: "ToView", sender: nil)
        }else {
            enterPasswordTextField.isHidden = false
            textLabel.isHidden = false
        }
        
    }
    
    
    @IBAction func EnterButton(_ sender: Any) {
        if userDefaults.object(forKey: "front") as? String == enterPasswordTextField.text {
            performSegue(withIdentifier: "ToView", sender: nil)
        }
    }
    
}
