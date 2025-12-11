import DesignSystem
import SwiftUI

struct PromptTextFieldExampleView: View {
    @State private var text = String()
    
    var body: some View {
        PromptTextField(.promptTextFieldTitle, text: self.$text)
            .padding()
    }
}

#Preview {
    PromptTextFieldExampleView()
}
