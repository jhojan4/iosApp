//
//  BackGround.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct TopScreen: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(AppColors.secondaryContainerLight.opacity(0.5))
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedCorner(radius: 100, corners: [.bottomLeft]))
    }
}


struct BackGround: View {
    var body: some View {
        VStack {
            TopScreen()
            Spacer()
            EndScreen()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
import SwiftUI

struct EndScreen: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 0, style: .continuous)
            .fill(AppColors.secondaryContainerLight.opacity(0.5)) // 50% de opacidad (valor entre 0 y 1)
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedCorner(radius: 100, corners: [.topRight]))
    }
}


#Preview {
    BackGround()
}
