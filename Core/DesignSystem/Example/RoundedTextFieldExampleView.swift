import DesignSystem
import SwiftUI

struct RoundedTextFieldExampleView: View {
    var body: some View {
        RoundedTextField(.promptTextFieldTitle, text: .constant(""))
            .padding()
    }
}

#Preview {
    RoundedTextFieldExampleView()
}
