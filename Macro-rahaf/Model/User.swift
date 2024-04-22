//
//  User.swift
//  Macro-rahaf
//
//  Created by Rahaf ALghuraibi on 09/10/1445 AH.
//

import Foundation
struct User : Identifiable, Codable{
    let id: String
    let fullname : String
    let email : String
    
    var initials : String{
        let formatter = PersonNameComponentsFormatter()
        if let componets = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: componets)
        }
        return ""
    }
}
extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "rahaf ibrahim" , email: "test@gmail.com")
}
