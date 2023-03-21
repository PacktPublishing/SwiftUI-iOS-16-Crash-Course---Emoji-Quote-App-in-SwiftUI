
import SwiftUI

struct TheImageView: View {
    let img: Images
    let text: String
    let color: Color
    
    var fractionOfScreen: CGFloat
    var scaleText: CGFloat = 1.0
    var width: CGFloat {
        UIScreen.main.bounds.width * fractionOfScreen
    }
    
    
    var body: some View {
        Image(img.rawValue)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 20)
            .overlay(
            Text(text)
                .font(.largeTitle)
                .foregroundColor(color)
                .multilineTextAlignment(.center)
                .padding()
                .minimumScaleFactor(0.1)
                .scaleEffect(scaleText)
            )
            .clipShape(
            RoundedRectangle(cornerRadius:  10)
            )
            .padding()
            .frame(width: width)
    }
}
struct TheImageView_Previews: PreviewProvider {
    static var previews: some View {
        TheImageView(
            img: .img1,
            text: "Hello",
            color: whiteColor,
            fractionOfScreen: UIDevice.current.userInterfaceIdiom == .pad ? 1/3 : 1
        )
    }
}
