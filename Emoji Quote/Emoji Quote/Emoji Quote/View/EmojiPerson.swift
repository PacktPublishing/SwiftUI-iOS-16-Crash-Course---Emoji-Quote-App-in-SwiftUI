
import SwiftUI

struct EmojiPerson: View {
    let imageName: String
    let eyesName: String
    let imageScale: CGFloat
    let eyesScale: CGFloat
    let offsetEyes: CGPoint
    @State private var blink: Bool = false
    
    var body: some View {
        ZStack {
            Image(imageName)
                .scaleEffect(imageScale)
            
            Image(eyesName)
                .scaleEffect(eyesScale)
                .scaleEffect( y: blink ? 0 : 1)
                .offset(x: offsetEyes.x, y: offsetEyes.y)
                .animation(
                    .timingCurve(0.68, -0.6, 0.32, 1.6)
                    .delay(3)
                    .repeatForever(autoreverses: false),
                    value: blink
                )
        }
        .onAppear {
            blink.toggle()
        }
    }
}

struct EmojiPerson_Previews: PreviewProvider {
    static var previews: some View {
        EmojiPerson(
            imageName: ninja,
            eyesName: ninjaEyes,
            imageScale: 3,
            eyesScale: 2,
            offsetEyes: CGPoint(x: 0, y: -7))
    }
}
