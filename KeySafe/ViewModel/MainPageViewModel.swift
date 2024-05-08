//
//  MainPageViewModel.swift
//  KeySafe
//
//  Created by ozan on 30.04.2024.
//

import Foundation
import RxSwift

class MainPageViewModel {
    var krepo = PasswordsDaoRepository()
    var passwordList = BehaviorSubject<[PasswordsModel]>(value: [PasswordsModel]())
    
    init() {
        passwordList = krepo.passwordList
        passwordsLoad()
    }
    
    
    func passwordsLoad(){
        krepo.passwordsLoad()
        
    }
}
