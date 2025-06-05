//
//  firestoreModel.swift
//  PocketPlanetIos
//
//  Created by Telematica on 5/06/25.
//
import FirebaseFirestore
//import FirebaseFirestoreSwift

struct UserProfile: Identifiable, Codable {
    @DocumentID var id: String?            // ID automático de Firestore (opcional)
    
    var userName: String
    var email: String
    var country: String
    var phoneNumber: String
    var password: String
    var repeatPassword: String
    
    // Opcional: inicializador si lo necesitas
    init(
        userName: String = "",
        email: String = "",
        country: String = "",
        phoneNumber: String = "",
        password: String = "",
        repeatPassword: String = ""
    ) {
        self.userName = userName
        self.email = email
        self.country = country
        self.phoneNumber = phoneNumber
        self.password = password
        self.repeatPassword = repeatPassword
    }
}

