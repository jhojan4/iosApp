

import SwiftUI

struct AgregarPlantaView: View {
    @StateObject private var viewModel = AgregarPlantaViewModel()
    @State private var mostrarAlerta = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                // Fondo solo en la parte superior
                VStack {
                    TopScreen()
                        .ignoresSafeArea()
                    Spacer()
                }
                ScrollView {
                    VStack(spacing: 16) {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(AppColors.tertiaryLight)
                        
                        Group {
                            TextField("Nombre de la Planta", text: $viewModel.nombrePlanta)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Tipo de Planta", text: $viewModel.tipoPlanta)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Horas de Sol", text: $viewModel.horasSol)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Cantidad de Agua (Lt)", text: $viewModel.cantidadAgua)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Tipo de Fertilización", text: $viewModel.tipoFertilizacion)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Información Adicional", text: $viewModel.informacionAdicional)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        
                      
                        
                        Button(action: {
                            viewModel.guardarPlanta()
                            mostrarAlerta = true
                        }) {
                            Text("Guardar Planta")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background( AppColors.tertiaryLight)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 20)
                        .alert(isPresented: $mostrarAlerta) {
                            Alert(
                                title: Text("Éxito"),
                                message: Text(viewModel.mensajeConfirmacion ?? ""),
                                dismissButton: .default(Text("OK")) {
                                    // Si quieres regresar automáticamente después de guardar:
                                    // presentationMode.wrappedValue.dismiss()
                                }
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Agregar Planta")
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Regresar")
                }
            })
        }
    }
}

struct AgregarPlantaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarPlantaView()
    }
}
