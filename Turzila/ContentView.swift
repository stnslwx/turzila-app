import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.white)
                .frame(width: 450)
            Text("Hello, world!")
            Spacer()
        }
        .padding(.horizontal)
        .background(Color("universalPurple")).ignoresSafeArea(.all, edges: .all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
