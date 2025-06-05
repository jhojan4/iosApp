//
//  registerView.swift
//  PocketPlanetIos
//
//  Created by Telematica on 4/06/25.
//

import SwiftUI

struct registerView: View {
    @Environment(\.dismiss) private var dismiss // ⬅️ Importante
    var navigate:(AppRoute)->Void
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
            cardRegister()
        }
    }
}

#Preview {
    NavigationStack{
        registerView(navigate:{ route in print("\(route)")})
        
    }
}
