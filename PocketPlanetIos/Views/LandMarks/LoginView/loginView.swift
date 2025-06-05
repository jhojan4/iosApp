//
//  loginView.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct loginView: View {
    
    var navigate: (AppRoute)->Void
    @Environment(\.dismiss) private var dismiss // ⬅️ Importante
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
                        dismiss()
            
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding() // Opcional: para no pegarlo completamente al borde
            
            // Contenido principal
            cardLogin(navigate: navigate)
        }
    }
}


