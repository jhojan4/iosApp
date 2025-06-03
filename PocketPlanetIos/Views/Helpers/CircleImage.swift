/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleImage: View {
    var image: Image
    var size:Float
    var border: Float
    var shadow: Float
    var body: some View {
        image
            .resizable() // Habilita cambio de tamaño
            .scaledToFill() // Para que se llene el círculo correctamente
            .frame(width: CGFloat(size), height: CGFloat(size))// Tamaño fijo circular
            .clipShape(Circle())
            .overlay {
                Circle().stroke(AppColors.black, lineWidth: CGFloat(border))
            }
            .shadow(radius: CGFloat(shadow))
    }
}


#Preview {
    CircleImage(image: Image("eucalipto"),size:100.0,border:1,shadow:1)
}
