
import SwiftUI

struct ForEachExampleView: View {
    let someText: [String] = [
        "Welcome",
        "back.",
        "How",
        "are",
        "you?",
        "I",
        "have",
        "a lot",
        "more",
        "to",
        "say."
    ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 50) {
                ForEach(someText, id: \.self) { text in
                    Text(text)
                        
                }
                
            }
            .font(.title)
        .fontWeight(.semibold)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachExampleView()
    }
}
