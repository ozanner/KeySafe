//
//  CreatePageViewModel.swift
//  KeySafe
//
//  Created by ozan on 6.05.2024.
//

import UIKit

class CreatePageViewModel {
    var krepo = PasswordsDaoRepository()
    
    func save(mainTitle : String, mail : String, passwords : String, link : String, notes : String) {
        krepo.save(mainTitle: mainTitle, mail: mail, passwords: passwords, link: link, notes: notes)
    }
}
