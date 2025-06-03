//
//  PresentationView.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct PresentationView: View {
    var body: some View {
        ZStack {
            VStack{
                TitleIcon()
                    .padding(.top,60)
                Spacer()           // Empuja EndScreen hacia abajo
                EndScreen()
            }
        
            
    
                MiddlePresentationView()
            
            VStack {
                Spacer() // Empuja los botones hacia la parte baja
                
                HStack(spacing: 20) {
                    AppButtons.Styled(title: "Iniciar Sesión") {
                        print("Debe ir a Iniciar Sesión")
                    }
                    AppButtons.Styled(title: "Registrar") {
                        print("Debe ir a Registro")
                    }
                }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 120) // ✅ No al final, sino con espacio
                }

        }
    }
}


#Preview {
    PresentationView()
}
