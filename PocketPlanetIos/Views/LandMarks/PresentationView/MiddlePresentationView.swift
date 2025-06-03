//
//  MiddlePresentationView.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct MiddlePresentationView: View {
    var body: some View {
        HStack{
            VStack{
                ZStack(alignment: .center){
                    AppButtons.CircleIcon(systemImage: "chevron.left",background: AppColors.surfaceLight,size:25) {
                        print("Icono redondo presionado")
                    }
                    .offset(x: -130)
                    CircleImage(image: Image("eucalipto"),size:50.0,border:1,shadow:1)
                        .offset(x: -70)
                    CircleImage(image: Image("eucalipto"),size:70.0,border:1,shadow:1)
                        .offset(x: -40)
                    CircleImage(image: Image("eucalipto"),size:90.0,border:1,shadow:1)
                        .offset(x: -10)
                    CircleImage(image: Image("eucalipto"),size:130.0,border:1,shadow:1)
                        .offset(x: 50)
                    AppButtons.CircleIcon(systemImage: "chevron.right",background: AppColors.surfaceLight,size:25) {
                        print("Icono redondo presionado")
                    }
                    .offset(x: 150)                }
                Text("Colocar como un View Model-Prueba de Commit Jhojan")
        
            
            }
        }
    }
}

#Preview {
    MiddlePresentationView()
}
