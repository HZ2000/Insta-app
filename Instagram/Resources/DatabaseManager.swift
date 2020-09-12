//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Hayk Zakaryan on 9/11/20.
//  Copyright © 2020 Hayk Zakaryan. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK: - Public
  
    ///Check if username and email is available
    /// - Parameters
    /// - email: String representing email
    /// - username: String representing username
    public func canCreateNewUser(with email: String, username: String , completion: (Bool) -> Void) {
        completion(true)
    }
    
    ///Insert new user data to database
    /// - Parameters
    /// - email: String representing email
    /// - username: String representing username
    /// - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String , username: String , completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error , _ in
            if error == nil {
                completion(true)
                return
            }
            
            else {
                completion(false)
                return
            }
        }
    }
}
