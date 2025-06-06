
import SwiftUI

struct AgregarPlantaView: View {
    @StateObject private var viewModel = AgregarPlantaViewModel()
    @State private var mostrarAlerta = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, 20)
                    
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
                            .background(Color.blue)
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
