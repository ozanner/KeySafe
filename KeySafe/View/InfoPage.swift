//
//  InfoPage.swift
//  KeySafe
//
//  Created by ozan on 6.02.2024.
//

import UIKit
class InfoPage : UIViewController {
    
    @IBOutlet weak var mainTitle: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    var password : PasswordsModel?
    var viewModel = InfoPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = password {
            mainTitle.text = p.mainTitle
            mail.text = p.mail
            passwordTextField.text = p.password
            linkTextField.text = p.link
            notesTextField.text = p.notes
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let mT = mainTitle.text, let m = mail.text, let pT = passwordTextField.text, let lT = linkTextField.text, let nT = notesTextField.text, let p = password {
            viewModel.update(password: p, mainTitle: mT, mail: m, passwords: pT, link: lT, notes: nT)
        }
        let alert = UIAlertController(title: "Success", message: "Success updates", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { action in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}
