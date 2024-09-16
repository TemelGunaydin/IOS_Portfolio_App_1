
import SwiftUI

struct DDGButton: View {
    
    var title: String
    var color: Color = .brandPrimary
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .frame(width: 280, height: 44)
                .background(color.gradient)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

#Preview("Light Mode") {
    DDGButton(title: "Test Button")
}

#Preview("Dark Mode") {
    DDGButton(title: "Test Button")
        .preferredColorScheme(.dark)
}

#Preview("Dark Landscape", traits: .landscapeRight) {
    DDGButton(title: "Test Button")
        .preferredColorScheme(.dark)
}

