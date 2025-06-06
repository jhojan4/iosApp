
import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift

class AgregarPlantaViewModel: ObservableObject {
    @Published var nombrePlanta: String = ""
    @Published var tipoPlanta: String = ""
    @Published var horasSol: String = ""
    @Published var cantidadAgua: String = ""
    @Published var tipoFertilizacion: String = ""
    @Published var informacionAdicional: String = ""
    
    @Published var mensajeConfirmacion: String? = nil
    
    private var db = Firestore.firestore()
    
    func guardarPlanta() {
        let plant = Plant(
            id: nil,
            nombre: nombrePlanta,
            tipo: tipoPlanta,
            horasSol: Int(horasSol) ?? 0,
            cantidadAgua: Float(cantidadAgua) ?? 0.0,
            tipoFertilizacion: tipoFertilizacion,
            informacionAdicional: informacionAdicional
        )
        
        do {
            _ = try db.collection("plantas").addDocument(from: plant) { [weak self] error in
                if let error = error {
                    self?.mensajeConfirmacion = "Error al guardar: \(error.localizedDescription)"
                } else {
                    self?.mensajeConfirmacion = "✅ Planta registrada correctamente"
                    self?.limpiarCampos()
                }
            }
        } catch {
            mensajeConfirmacion = "Error al preparar los datos: \(error.localizedDescription)"
        }
    }
    
    private func limpiarCampos() {
        nombrePlanta = ""
        tipoPlanta = ""
        horasSol = ""
        cantidadAgua = ""
        tipoFertilizacion = ""
        informacionAdicional = ""
    }
}
