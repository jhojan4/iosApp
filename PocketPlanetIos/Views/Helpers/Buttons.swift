//
//  Buttons.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct AppButtons {

    // MARK: - Botón básico con texto
    struct TextOnly: View {
        var title: String
        var action: () -> Void

        var body: some View {
            Button(action: action) {
                Text(title)
            }
        }
    }

    // MARK: - Botón estilizado (relleno y bordes redondeados)
    struct Styled: View {
        var title: String
        var background: Color = .blue
        var foreground: Color = .white
        var action: () -> Void

        var body: some View {
            Button(action: action) {
                Text(title)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: 150,height: 30)
                    .foregroundColor(foreground)
                    .background(AppColors.tertiaryLight)
                    .cornerRadius(20)
            }
        }
    }
    // MARK: - Botón con icono SF Symbol + texto
    struct WithIcon: View {
        var title: String
        var systemImage: String
        var action: () -> Void

        var body: some View {
            Button(action: action) {
                Label(title, systemImage: systemImage)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
    }

    // MARK: - Botón redondo con solo ícono
    struct CircleIcon: View {
        var systemImage: String
        var background: Color = .blue
        var foreground: Color = .black
        var size: CGFloat = 44
        var borderColor:Color  = .black
        var action: () -> Void
        var body: some View {
            Button(action: action) {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding()
                    .background(background)
                    .foregroundColor(foreground)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(borderColor,lineWidth: 2)
                    )
            }
        }
    }
}

