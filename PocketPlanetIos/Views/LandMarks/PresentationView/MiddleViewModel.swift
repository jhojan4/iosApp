//
//  MiddleViewModel.swift
//  PocketPlanetIos
//
//  Created by Telematica on 5/06/25.
//
import SwiftUI

class PresentationViewModel: ObservableObject {
    @Published var imageIndex: Int = 0
    @Published var stringsIndex: Int = 0

    let images = [
        "eucalipto",
        "ficus",
        "geranio",
        "dalia"
    ]

    let stringKeys = [
        "alerts_text",
        "statistics_text",
        "recomendation_text",
        "logo_text"
    ]

    func previousImage() {
        imageIndex = (imageIndex - 1 + images.count) % images.count
        stringsIndex = (stringsIndex - 1 + stringKeys.count) % stringKeys.count
    }

    func nextImage() {
        imageIndex = (imageIndex + 1) % images.count
        stringsIndex = (stringsIndex + 1) % stringKeys.count
    }
}

