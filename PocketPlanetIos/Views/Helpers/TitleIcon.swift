//
//  TitleIcon.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct TitleIcon: View {
    var body: some View {
        ZStack(alignment: .center){
            HStack{
                Text("POCKET PLANET")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(AppColors.onBackgroundLight)
                    .multilineTextAlignment(.center)
                CircleImage(image: Image("eucalipto"),size:100.0,border:1,shadow:1)            }
        }
    }
}

#Preview {
    TitleIcon()
}
