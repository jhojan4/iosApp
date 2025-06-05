//
//  navigation.swift
//  PocketPlanetIos
//
//  Created by Telematica on 4/06/25.
//

import SwiftUI

enum AppRoute:Hashable {
    case login
    case register
}
// NavigationRouter.swift

struct NavigationRouter: View {
    @State private var path: [AppRoute] = []
    @StateObject private var presentationViewModel = PresentationViewModel() // ✅
    var body: some View {
        NavigationStack(path: $path) {
            PresentationView(viewModel: presentationViewModel,navigate: { route in
                path.append(route)
            })
            .navigationDestination(for: AppRoute.self) { route in
                switch route{
                case .register:
                    registerView(navigate: { path.append($0)})
                case .login:
                    // loginView() // Si lo implementas después
                    loginView(navigate: { path.append($0)})
                }
            }
        }
    }
}
