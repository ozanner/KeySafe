//
//  CreatePage.swift
//  KeySafe
//
//  Created by ozan on 6.02.2024.
//

import UIKit

class CreatePage : UIViewController {
    
    @IBOutlet weak var mainTitleTextView: UITextField!
    @IBOutlet weak var mailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var linkTextView: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    var viewModel = CreatePageViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let mT = mainTitleTextView.text, let m = mailTextView.text, let pT = passwordTextView.text, let lT = linkTextView.text, let nT = notesTextView.text {
            viewModel.save(mainTitle: mT, mail: m, passwords: pT, link: lT, notes: nT)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
