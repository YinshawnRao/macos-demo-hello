import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("HelloDemo")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Hello, macOS")
                .font(.title2)
                .foregroundStyle(.secondary)

            Text("Count: \(count)")
                .font(.title)
                .monospacedDigit()

            Button("Increment") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .keyboardShortcut(.defaultAction)
        }
        .padding(40)
        .frame(minWidth: 360, minHeight: 260)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
