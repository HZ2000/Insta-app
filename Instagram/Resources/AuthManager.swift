//
//  AuthManager.swift
//  Instagram
//
//  Created by Hayk Zakaryan on 9/11/20.
//  Copyright © 2020 Hayk Zakaryan. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    //MARK: - Public
    public func registerNewUser(username: String , email: String , password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil , result != nil else {
                        //Firebase auth could not create account
                        completion(false)
                        return
                    }
                    
                    //Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else {
                            //Failed to insert to Database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //eather username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String? , email: String? , password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
           //email log in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else if let username = username {
            //username log in
            print(username)
        }
    }
    
}
