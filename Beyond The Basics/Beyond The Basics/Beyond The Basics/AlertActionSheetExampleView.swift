
import SwiftUI

struct AlertActionSheetExampleView: View {
    let balloonURL: String = "https://images.pexels.com/photos/5318767/pexels-photo-5318767.jpeg?auto=compress&cs=tinysrgb&w=1600"
    let stopURL: String = "https://images.pexels.com/photos/39080/stop-shield-traffic-sign-road-sign-39080.jpeg?auto=compress&cs=tinysrgb&w=1600"
    
    @State private var pressCount = 0
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var fonts: [Font] = [
        .largeTitle, .subheadline, .headline, .title, .title2
    ]
    
    var maxClicks: Int {
        fonts.count
    }
    
    var promptAction: (prompt: String, icon: String) {
        switch (pressCount) {
        case 0:
            return ("Press Me","hand.point.up.left")
        case 1...maxClicks - 2:
            return ("Press \(maxClicks - pressCount) more times","hand.thumbsup")
        default:
            return ("Press if you Dare","hamds.raised.fill")
        }
    }
    
    var buttonFont: Font {
        fonts[pressCount % fonts.count]
    }
    
    
    var body: some View {
        ZStack {
            if pressCount < maxClicks / 2 {
                Color.blue.opacity(0.7).ignoresSafeArea()
            } else {
                Color.purple.opacity(0.7).ignoresSafeArea()
            }
            
            
            
            VStack {
                Text("Alert and Action Sheet Example")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                Button(action: {
                    withAnimation {
                        showActionSheet.toggle()
                    }
                }, label: {
                    ImageFromURLView(url: balloonURL)
                })
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text(#"Set "pressCount" variable"#), buttons: [
                        .cancel(Text("Cancel")),
                        .default(Text(#"Set "pressCount" to one."#), action: { pressCount = 1}),
                        .default(Text(#"Set "pressCount" to two"#), action: {pressCount = 2}),
                        .default(Text(#"Set "pressCount" to three"#), action: {pressCount = 3}),
                        .destructive(Text("Reset"), action: {
                            pressCount = 0
                        })
                        
                    ])
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        pressCount += 1
                        if pressCount == maxClicks {
                            showAlert.toggle()
                            pressCount = 0
                        }
                    }
                }, label: {
                    Label(promptAction.prompt, systemImage: promptAction.icon)
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .font(buttonFont)
                        .padding()
                        .overlay(
                        Capsule()
                            .stroke(.black, lineWidth: CGFloat(pressCount)+1)
                        )

                })
                .alert("You Clicked \(maxClicks) times !", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {
                        withAnimation {
                            pressCount = 0
                        }
                    }
                }
            }
        }
    }
}

struct ImageFromURLView: View {
    let url: String
    
    var randomEmoji: String {
        ["🥸","🥵","👿","😵","🙃"].randomElement() ?? ""
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url), scale: 2) {phase in
            if let image = phase.image {
                // Valid non-nil image
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .frame(width: UIScreen.main.bounds.width*0.8)
            } else if phase.error != nil {
                Text("No image available \(randomEmoji)")
            } else {
                ProgressView()
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}



struct AlertActionSheetExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AlertActionSheetExampleView()
    }
}
