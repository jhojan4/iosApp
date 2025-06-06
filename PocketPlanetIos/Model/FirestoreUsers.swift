//
//  FirestoreUsers.swift
//  PocketPlanetIos
//
//  Created by Telematica on 6/06/25.
//

import FirebaseFirestore

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var currentUser: UserProfile? = nil
    
    func fetchUserProfile(userID: String) {
        db.collection("users").document(userID).getDocument { document, error in
            if let error = error {
                print("Error fetching user: \(error)")
                return
            }
            
            if let document = document, document.exists {
                do {
                    self.currentUser = try document.data(as: UserProfile.self)
                } catch {
                    print("Error decoding user: \(error)")
                }
            }
        }
    }
    func registerUser(userProfile: UserProfile, completion: @escaping (Bool, String?) -> Void) {
        do {
            _ = try db.collection("users").addDocument(from: userProfile) { error in
                if let error = error {
                    completion(false, "Error al registrar: \(error.localizedDescription)")
                } else {
                    self.currentUser = userProfile
                    completion(true, nil)
                }
            }
        } catch {
            completion(false, "Error serializando el perfil: \(error.localizedDescription)")
        }
    }

}

