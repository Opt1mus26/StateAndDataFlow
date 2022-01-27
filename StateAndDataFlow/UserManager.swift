//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import Foundation

class UserManager: ObservableObject {
    
    @Published var user = User()
    var isValide: Bool {
        user.name.count >= 3
    }
    
    init() {}
    init(user: User) {
        self.user = user
    }
}

struct User {
    var name = ""
    var isRegister = false
}