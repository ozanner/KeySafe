//
//  SettingsPage.swift
//  KeySafe
//
//  Created by ozan on 6.02.2024.
//

import UIKit

class SettingsPage : UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    let  userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if userDefaults.object(forKey: "front") == nil {
            switchOutlet.isOn = false
        }else {
            switchOutlet.isOn = true
        }
      
    }
    
    @IBAction func Switch(_ sender: UISwitch) {
        if switchOutlet.isOn == false {
            self.userDefaults.removeObject(forKey: "front")
        } else {
            self.userDefaults.set("", forKey: "front")
        }
    }
    
    @IBAction func Save(_ sender: UIButton) {
        if passwordTextField.text == rePasswordTextField.text {
            self.userDefaults.set(passwordTextField.text, forKey: "front")
            self.userDefaults.synchronize()
        }else {
            print("Şifre aynı değil.")
        }
    }
    
    
    
}
