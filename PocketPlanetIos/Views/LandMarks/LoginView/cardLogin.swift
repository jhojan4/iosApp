//
//  cardLogin.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct cardLogin: View {
    var navigate:(AppRoute)->Void
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                
                CircleImage(image: Image("eucalipto"), size: 130.0, border: 1, shadow: 1)
                
                Spacer().frame(height: 15)
                
                LabelsCards(descripcion: "Usuario", icono: "person.circle.fill")
                
                LabelsCards(descripcion: "Contraseña", icono: "lock.fill")
                
                AppButtons.Styled(title: "Iniciar Sesión") {
                    print("Debe ir a Iniciar Sesión despues de registrar")
                    navigate(.host)  
                }
                
                AppButtons.TextOnly(title: "¿Aun no tienes cuenta?") {
                    print("Ir a registrar")
                    navigate(.register)
                }
            }
            .padding(30)
            //frame(maxWidth: .infinity, height: 600)
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


struct LabelsCards: View {
    var descripcion: String
    var icono: String
    var action: () -> Void = {}
    
    var body: some View {
        Label(descripcion, systemImage: icono)
            .frame(maxWidth: .infinity, alignment: .leading) // Alinea el contenido del Label a la izquierda
            .padding(.horizontal) // Opcional: para dar espacio a los lados
            .frame(width: 200, height: 30, alignment: .leading) // Tamaño fijo, manteniendo alineación a la izquierda
            .background(AppColors.surfaceLight)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
    }
}
