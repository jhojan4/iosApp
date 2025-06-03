//
//  AppColors.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//
import SwiftUI

// MARK: - Extensión para permitir inicializar colores con hexadecimales
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                           (int >> 8) * 17,
                           (int >> 4 & 0xF) * 17,
                           (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                           int >> 16,
                           int >> 8 & 0xFF,
                           int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (
                int >> 24,
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

// MARK: - Contenedor de colores personalizados (igual que Color.kt)
struct AppColors {
    // 🌞 Light Theme
    static let surfaceLight = Color.white
    static let primaryLight = Color(hex: "#2A6C00")
    static let onPrimaryLight = Color.white
    static let primaryContainerLight = Color(hex: "#4EBD00")
    static let onPrimaryContainerLight = Color(hex: "#184500")
    static let black=Color.black
    static let secondaryLight = Color(hex: "#346B17")
    static let onSecondaryLight = Color.white
    static let secondaryContainerLight = Color(hex: "#B4F48F")
    static let onSecondaryContainerLight = Color(hex: "#3A711D")

    static let backgroundLight = Color(hex: "#F4FCE9")
    static let onBackgroundLight = Color(hex: "#171D12")

    // 🌚 Dark Theme
    static let primaryDark = Color(hex: "#6FE033")
    static let onPrimaryDark = Color(hex: "#123800")
    static let secondaryDark = Color(hex: "#99D776")
    static let onSecondaryDark = Color(hex: "#123800")
    static let backgroundDark = Color(hex: "#0F150B")
    static let onBackgroundDark = Color(hex: "#DEE5D3")

    // Puedes seguir agregando más según tu archivo Color.kt
    // MARK: - Tertiary Light
        static let tertiaryLight = Color(hex: "#006B5D")
        static let onTertiaryLight = Color.white
        static let tertiaryContainerLight = Color(hex: "#00BBA4")
        static let onTertiaryContainerLight = Color(hex: "#00443B")

        // MARK: - Tertiary Dark
        static let tertiaryDark = Color(hex: "#48DCC4")
        static let onTertiaryDark = Color(hex: "#003730")
        static let tertiaryContainerDark = Color(hex: "#00BBA4")
        static let onTertiaryContainerDark = Color(hex: "#00443B")

        // MARK: - Puedes continuar con otros si quieres mediumContrast o highContrast
    
}
