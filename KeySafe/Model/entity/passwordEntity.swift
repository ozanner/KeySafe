//
//  passwordEntity.swift
//  KeySafe
//
//  Created by ozan on 30.04.2024.
//

import Foundation

class Passwords {
    var id : Int?
    var mainTitle : String?
    var mail : String?
    var password : String?
    var link : String?
    var notes : String?
    init() {
        
    }
    init(id:Int, mainTitle: String, mail: String, password: String, link: String, notes: String) {
        self.id = id
        self.mainTitle = mainTitle
        self.mail = mail
        self.password = password
        self.link = link
        self.notes = notes
    }
}
