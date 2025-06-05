//
//  cardRegister.swift
//  PocketPlanetIos
//
//  Created by Telematica on 4/06/25.
//
/*
import SwiftUI

struct cardRegister: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var country = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                
                CircleImage(image: Image("eucalipto"), size: 130.0, border: 1, shadow: 1)
                
                Spacer().frame(height: 15)
                LabelsCards(descripcion: "Usuario", icono: "person.circle.fill")
                LabelsCards(descripcion: "Email", icono: "envelope.fill")
                LabelsCards(descripcion: "Pais", icono: "location.fill")
                LabelsCards(descripcion: "Celular", icono: "phone.fill")
                LabelsCards(descripcion: "Contraseña", icono: "lock.fill")
                LabelsCards(descripcion: "Repetir Contraseña", icono: "lock.fill")
                
                AppButtons.Styled(title: "Registrar") {
                    print("Debe ir a Iniciar Sesión")
                }
                
                
            }
            .padding(30)
            .frame(width: 300, height: 600)
            .background(AppColors.surfaceDimLight.opacity(0.2))
            .cornerRadius(20)
            .shadow(radius: 7)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(AppColors.black.opacity(0.6), lineWidth: 1)
            )
            .padding()
        }
    }

}

#Preview {
    cardRegister()
}
*/
import SwiftUI
import FirebaseFirestore


struct cardRegister: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var country = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var repeatPassword = ""

    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 15) {
                CircleImage(image: Image("eucalipto"), size: 130.0, border: 1, shadow: 1)
                Spacer().frame(height: 10)

                // Campos de texto
                Group {
                    CustomTextField(title: "Usuario", text: $userName, systemImage: "person.circle.fill")
                    CustomTextField(title: "Email", text: $email, systemImage: "envelope.fill", keyboard: .emailAddress)
                    CustomTextField(title: "País", text: $country, systemImage: "location.fill")
                    CustomTextField(title: "Celular", text: $phoneNumber, systemImage: "phone.fill", keyboard: .phonePad)
                    CustomSecureField(title: "Contraseña", text: $password, systemImage: "lock.fill")
                    CustomSecureField(title: "Repetir Contraseña", text: $repeatPassword, systemImage: "lock.fill")
                }

                // Botón Registrar
                AppButtons.Styled(title: "Registrar") {
                    if password == repeatPassword && !email.isEmpty {
                        authViewModel.signUp(email: email, password: password)

                        let db = Firestore.firestore()
                        let newUser = UserProfile(
                            userName: userName,
                            email: email,
                            country: country,
                            phoneNumber: phoneNumber,
                            password: password,
                            repeatPassword: repeatPassword
                        )

                        do {
                            _ = try db.collection("users").addDocument(from: newUser)
                            print("Usuario guardado en Firestore")
                        } catch {
                            print("Error al guardar en Firestore: \(error.localizedDescription)")
                        }
                    } else {
                        print("Las contraseñas no coinciden o el email está vacío.")
                    }
                }

            }
            .padding(30)
            .frame(width: 320)
            .background(AppColors.surfaceDimLight.opacity(0.2))
            .cornerRadius(20)
            .shadow(radius: 7)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(AppColors.black.opacity(0.6), lineWidth: 1)
            )
            .padding()
        }
    }
}

// TextField personalizado
struct CustomTextField: View {
    var title: String
    @Binding var text: String
    var systemImage: String
    var keyboard: UIKeyboardType = .default

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.gray)
            TextField(title, text: $text)
                .keyboardType(keyboard)
                .autocapitalization(.none)
        }
        .padding()
        .background(AppColors.surfaceLight)
        .frame(width: 300, height: 30, alignment: .leading)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.2)))
    }
}

// SecureField personalizado
struct CustomSecureField: View {
    var title: String
    @Binding var text: String
    var systemImage: String

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.gray)
            SecureField(title, text: $text)
        }
        .padding()
        .frame(width: 300, height: 30, alignment: .leading)
        .background(AppColors.surfaceLight)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.2)))
    }
}
