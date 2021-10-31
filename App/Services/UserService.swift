//
//  LoginService.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 30/10/21.
//

import Foundation

class UserService {
    private static let TOKEN = "TOKEN"
    
    static func setToken(_ token: String) {
        UserDefaults.standard.setValue(token, forKey: token)
    }
    
    static func getToken() -> String? {
        return UserDefaults.standard.string(forKey: TOKEN)
    }
    
    static func hasToken() -> Bool {
        return getToken() != nil
    }
    
    static func saveDataUser(id:String, name: String, email: String, cpf: String, appDelegate: AppDelegate) {
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = User(context: context)
        newUser.setValue(id, forKey: "id")
        newUser.setValue(name, forKey: "name")
        newUser.setValue(email, forKey: "email")
        newUser.setValue(cpf, forKey: "cpf")
        
        do {
           try context.save()
          } catch {
           print("Failed saving")
        }
    }
    
    static func deleteUser(user: User, appDelegate: AppDelegate) {
        let context = appDelegate.persistentContainer.viewContext
        context.delete(user)
        
        do {
           try context.save()
          } catch {
           print("Failed delete")
        }
    }
    
    static func getUser(appDelegate: AppDelegate) {
        do {
            let context = appDelegate.persistentContainer.viewContext
            let users = try context.fetch(User.fetchRequest())
            print("user ", users)
        } catch {
            // error
        }
    }
}
