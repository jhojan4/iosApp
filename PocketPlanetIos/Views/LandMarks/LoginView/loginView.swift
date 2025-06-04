//
//  loginView.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct loginView: View {
    var navigate: (AppRoute)->Void
    var body: some View {
        ZStack {
            BackGround()

            // Botón en la esquina superior izquierda
            VStack {
                HStack {
                    AppButtons.CircleIcon(
                        systemImage: "chevron.left",
                        background: AppColors.tertiaryLight,
                        size: 25
                    ) {
                        print("Devolver")
            
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding() // Opcional: para no pegarlo completamente al borde
            
            // Contenido principal
            cardLogin(onLogin:{"Inicio de Sesion"}, onBack: {})
        }
    }
}


