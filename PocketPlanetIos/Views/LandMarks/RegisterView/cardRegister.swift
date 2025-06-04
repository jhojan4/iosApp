//
//  cardRegister.swift
//  PocketPlanetIos
//
//  Created by Telematica on 4/06/25.
//

import SwiftUI

struct cardRegister: View {
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
