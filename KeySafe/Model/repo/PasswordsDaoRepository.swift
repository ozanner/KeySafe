//
//  PasswordsDaoRepository.swift
//  KeySafe
//
//  Created by ozan on 30.04.2024.
//

import Foundation
import RxSwift
import CoreData

class PasswordsDaoRepository {
    var passwordList = BehaviorSubject<[PasswordsModel]>(value: [PasswordsModel]())
    let context = appDelegate.persistentContainer.viewContext
    
    
    func save(mainTitle : String, mail : String, passwords : String, link : String, notes : String){
        let passwordModel = PasswordsModel(context: context)
        passwordModel.mainTitle = mainTitle
        passwordModel.mail = mail
        passwordModel.password = passwords
        passwordModel.link = link
        passwordModel.notes = notes
        
        appDelegate.saveContext()
        
    }
    
    func update(password : PasswordsModel, mainTitle : String, mail : String, passwords : String, link : String, notes : String) {
        password.mainTitle = mainTitle
        password.mail = mail
        password.password = passwords
        password.link = link
        password.notes = notes
        
        appDelegate.saveContext()
        
        
    }
    
    func delete(password : PasswordsModel){
        context.delete(password)
        appDelegate.saveContext()
        passwordsLoad()
    }
    
    func search(searchVocab:String){
        do{
            let fr = PasswordsModel.fetchRequest()
            fr.predicate = NSPredicate(format: "mainTitle CONTAINS[c] %@", searchVocab)
            
            let array = try context.fetch(fr)
            passwordList.onNext(array)
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    func passwordsLoad() {
        do{
            let liste = try context.fetch(PasswordsModel.fetchRequest())
            passwordList.onNext(liste)
        }catch {
            print(error.localizedDescription)
        }
    }
    
}
