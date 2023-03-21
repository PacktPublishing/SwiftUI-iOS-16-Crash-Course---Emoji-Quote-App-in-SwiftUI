

//Some comment

import SwiftUI

struct ContentView: View {
    @State var scale = 1.0
    @State var angle = 0.0
    
    var body: some View {
        ZStack {
            Color
                .purple
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Text("Let's get started !")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .rotation3DEffect(Angle(degrees: angle), axis: (x: 1, y: 0, z: 0))
                
                HStack(spacing: 0) {
                    Text("Enjoy")
                        .padding()
                        .background(Color.red)
                    Text("the")
                        .padding()
                        .background(Color.orange)
                    Text("course !")
                        .padding()
                        .background(Color.pink)
                }
                .cornerRadius(15)
                .scaleEffect(scale)
            }
            .padding()
        }
        .onAppear {
            withAnimation {
                angle = 360
                scale = 1.5
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
