import MarkdownUI
import SwiftUI

public struct ChatCell: View {
    public let prompt: String
    public let response: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Spacer(minLength: 60)
                Text(self.prompt)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color.defaultText)
                    .padding()
                    .background(Color.defaultBackground)
                    .cornerRadius(20)
            }
            Markdown(self.response)
        }
    }
    
    public init(prompt: String, response: String) {
        self.prompt = prompt
        self.response = response
    }
}
