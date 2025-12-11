import SwiftUI
import Utils

public struct PromptTextField: View {
    public var body: some View {
        HStack(alignment: .bottom, spacing: 7) {
            TextField(self.title, text: self.$text, axis: .vertical)
                .font(.system(size: 18, weight: .medium))
                .lineLimit(1...5)
                .padding(.vertical, 12)
                .padding(.leading, 16)
                .focused(self.$isFocused)
            if self.text.isBlank == false {
                Button(action: {
                    self.isFocused = false
                    self.onSubmit?()
                }) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 18, weight: .black))
                        .foregroundColor(Color.defaultBackground)
                        .frame(width: 32, height: 32)
                        .background(Color.defaultText)
                        .clipShape(Circle())
                }
                .padding(.bottom, 7)
                .padding(.trailing, 7)
                .transition(.opacity)
            }
        }
        .background(Color.defaultBackground)
        .clipShape(RoundedRectangle(cornerRadius: 23))
        .animation(.easeInOut(duration: 0.2), value: self.text.isBlank)
    }

    private let title: String
    private let onSubmit: (() -> Void)?
    
    @Binding private var text: String
    @FocusState private var isFocused: Bool

    public init(
        _ title: String,
        text: Binding<String>,
        onSubmit: (() -> Void)? = nil,
    ) {
        self.title = title
        self._text = text
        self.onSubmit = onSubmit
    }
}

public extension PromptTextField {
    func onSubmit(_ action: @escaping () -> Void) -> PromptTextField {
        PromptTextField(self.title, text: self.$text, onSubmit: action)
    }
}
