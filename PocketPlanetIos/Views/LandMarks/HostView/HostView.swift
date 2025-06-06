
import SwiftUI

struct HostView: View {
    @StateObject private var viewModel = HostViewModel()
    @State private var mostrarAgregarPlanta = false
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.plantas) { plant in
                            VStack {
                                Image(systemName: "leaf.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.green)
                                Text(plant.nombre)
                                    .font(.headline)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(radius: 4)
                        }
                    }
                    .padding()
                }
                Button(action: {
                    mostrarAgregarPlanta = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding()
                .sheet(isPresented: $mostrarAgregarPlanta) {
                    AgregarPlantaView()
                }
            }
            .navigationTitle("Plantas")
        }
    }
}
