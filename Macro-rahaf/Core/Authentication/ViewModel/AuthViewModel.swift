//
//  AuthViewModel.swift
//  Macro-rahaf
//
//  Created by Rahaf ALghuraibi on 11/10/1445 AH.
//

import Foundation

import Firebase

import FirebaseCore

import FirebaseFirestore
import FirebaseAuth
//import FirebaseFirestoreSwift
//import FirebaseFirestore

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}
@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    func signIn(withEmail email: String, password:String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch{
            print("debug: failed .. \(error.localizedDescription)")
        }
    }
    func createUser(withEmail email: String, password:String,fullname:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }catch{
            print("DEBUG: FAILED .. \(error.localizedDescription)")
        }
        
    }
    func signOut(){
        do{
            try Auth.auth().signOut() // sign out user on backend
            self.userSession = nil // wipes out user session and takes us back to login screeen
            self.currentUser = nil // wips out current user data model
        }catch{
            print("debug ... \(error.localizedDescription)")
        }
        
    }
    func deleteAccount(){
        
    }
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else{return}
        guard  let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else{return}
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("deb \(self.currentUser)")
    }
}
