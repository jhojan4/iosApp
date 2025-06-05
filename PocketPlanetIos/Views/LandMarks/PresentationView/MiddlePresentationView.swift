//
//  MiddlePresentationView.swift
//  PocketPlanetIos
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

struct MiddlePresentationView: View {
    @ObservedObject var viewModel: PresentationViewModel

    var body: some View {
        let count = viewModel.images.count
        let index = viewModel.imageIndex

        // Asegura que los índices estén dentro del rango [0, count)
        let indices = [
            (index - 1 + count) % count, // anterior
            index,                       // actual
            (index + 1) % count,
            (index + 2) % count
        ]

        return HStack {
            VStack {
                ZStack(alignment: .center) {
                    AppButtons.CircleIcon(
                        systemImage: "chevron.left",
                        background: AppColors.surfaceLight,
                        size: 25
                    ) {
                        viewModel.previousImage()
                    }
                    .offset(x: -130)

                    CircleImage(image: Image(viewModel.images[indices[0]]), size: 50.0, border: 1, shadow: 1)
                        .offset(x: -70)

                    CircleImage(image: Image(viewModel.images[indices[1]]), size: 70.0, border: 1, shadow: 1)
                        .offset(x: -40)

                    CircleImage(image: Image(viewModel.images[indices[2]]), size: 90.0, border: 1, shadow: 1)
                        .offset(x: -10)

                    CircleImage(image: Image(viewModel.images[indices[3]]), size: 130.0, border: 1, shadow: 1)
                        .offset(x: 50)

                    AppButtons.CircleIcon(
                        systemImage: "chevron.right",
                        background: AppColors.surfaceLight,
                        size: 25
                    ) {
                        viewModel.nextImage()
                    }
                    .offset(x: 150)
                }

                // Texto también con índice envuelto (ej. si usas lo de -1)
                let textIndex = (viewModel.stringsIndex - 1 + viewModel.stringKeys.count) % viewModel.stringKeys.count
                Text(LocalizedStringKey(viewModel.stringKeys[textIndex]))
                    .padding()
            }
        }
    }
}


//#Preview {
  //  MiddlePresentationView()
//} Corrige esto, los index
