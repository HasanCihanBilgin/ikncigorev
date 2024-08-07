import SwiftUI

struct ContentView: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var text3: String = "Text"
    @State private var text4: String = "Text"
    @State private var text5: String = "Text"
    @State private var text6: String = "Text"
    @State private var text7: String = "Text"
    @State private var text8: String = "Text"
    @State private var text9: String = "Text"

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Label", text: $text1)
                .textFieldStyle(StatefulTextFieldStyle(state: .empty))

            TextField("Label", text: $text2)
                .textFieldStyle(StatefulTextFieldStyle(state: .emptyHover))

            TextField("Label", text: $text3)
                .textFieldStyle(StatefulTextFieldStyle(state: .focus))

            TextField("Label", text: $text4)
                .textFieldStyle(StatefulTextFieldStyle(state: .focus))

            TextField("Label", text: $text5)
                .textFieldStyle(StatefulTextFieldStyle(state: .fill))

            TextField("Label", text: $text6)
                .textFieldStyle(StatefulTextFieldStyle(state: .emptyDisable))

            TextField("Label", text: $text7)
                .textFieldStyle(StatefulTextFieldStyle(state: .fillDisable))

            TextField("Label", text: $text8)
                .textFieldStyle(StatefulTextFieldStyle(state: .emptyError))

            TextField("Label", text: $text9)
                .textFieldStyle(StatefulTextFieldStyle(state: .fillError))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
