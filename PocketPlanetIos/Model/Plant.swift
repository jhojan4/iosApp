
import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift

struct Plant: Identifiable, Codable {
    @DocumentID var id: String?     // Este será el ID automático de Firestore
    let nombre: String // Solo nos interesa el nombre para mostrar
    var tipo: String
    var horasSol: Int
    var cantidadAgua: Float
    var tipoFertilizacion: String
    var informacionAdicional: String
    
}
