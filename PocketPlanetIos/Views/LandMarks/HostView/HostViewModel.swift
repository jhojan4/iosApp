
import Foundation
import FirebaseFirestore

class HostViewModel: ObservableObject {
    @Published var plantas: [Plant] = []
    private var db = Firestore.firestore()
    
    init() {
        fetchPlantas()
    }
    
    func fetchPlantas() {
        db.collection("plantas").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents: \(String(describing: error))")
                return
            }
            
            self.plantas = documents.compactMap { doc in
                try? doc.data(as: Plant.self)
            }
        }
    }
}
