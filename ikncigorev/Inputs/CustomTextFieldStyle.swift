import SwiftUI

enum TextFieldState {
    case empty
    case emptyHover
    case focus
    case fill
    case emptyDisable
    case fillDisable
    case emptyError
    case fillError
}

struct StatefulTextFieldStyle: TextFieldStyle {
    var state: TextFieldState

    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .background(state == .emptyDisable || state == .fillDisable ? Color(LightStyle.customColor6).opacity(0.1) : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(borderColor(for: state)), lineWidth: 2)
            )
            .disabled(state == .emptyDisable || state == .fillDisable)
    }
    
    private func borderColor(for state: TextFieldState) -> UIColor {
        switch state {
        case .empty: return LightStyle.customColor1
        case .emptyHover: return LightStyle.customColor2
        case .focus: return LightStyle.customColor3
        case .fill: return LightStyle.customColor5  // Aynı renk
        case .emptyDisable: return LightStyle.customColor5  // Aynı renk
        case .fillDisable: return LightStyle.customColor6
        case .emptyError: return LightStyle.customColor8
        case .fillError: return LightStyle.customColor9
        }
    }
}

struct CustomTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField("Label", text: .constant(""))
                .textFieldStyle(StatefulTextFieldStyle(state: .empty))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Empty")

            TextField("Label", text: .constant(""))
                .textFieldStyle(StatefulTextFieldStyle(state: .emptyHover))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Empty Hover")

            TextField("Label", text: .constant("Text"))
                .textFieldStyle(StatefulTextFieldStyle(state: .focus))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Focus")

            TextField("Label", text: .constant("Text"))
                .textFieldStyle(StatefulTextFieldStyle(state: .fill))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Fill")

            TextField("Label", text: .constant("Text"))
                .textFieldStyle(StatefulTextFieldStyle(state: .emptyDisable))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Empty Disable")

            TextField("Label", text: .constant("Text"))
                .textFieldStyle(StatefulTextFieldStyle(state: .fillDisable))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Fill Disable")

            TextField("Label", text: .constant(""))
                .textFieldStyle(StatefulTextFieldStyle(state: .emptyError))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Empty Error")

            TextField("Label", text: .constant("Text"))
                .textFieldStyle(StatefulTextFieldStyle(state: .fillError))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Fill Error")
        }
    }
}
