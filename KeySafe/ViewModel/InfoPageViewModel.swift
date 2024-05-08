//
//  InfoPageViewModel.swift
//  KeySafe
//
//  Created by ozan on 6.05.2024.
//

import UIKit

class InfoPageViewModel {
    var krepo = PasswordsDaoRepository()
    func update(password : PasswordsModel, mainTitle : String, mail : String, passwords : String, link : String, notes : String) {
        krepo.update(password: password, mainTitle: mainTitle, mail: mail, passwords: passwords, link: link, notes: notes)
    }
}
