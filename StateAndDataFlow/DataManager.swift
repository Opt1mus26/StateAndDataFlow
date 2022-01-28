//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Pavel Tsyganov on 28.01.2022.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "userManager"
    
    private init() {}
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(userData, forKey: key)
    }
    
    func decodeUser() -> User {
        guard let userData = userDefaults.object(forKey: key) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func deleteUser(userManager: UserManager) {
        userManager.user.isRegister.toggle()
        userManager.user.name = ""
        userDefaults.removeObject(forKey: key)
    }
}
