
import SwiftUI

struct GridImagesView: View {
    let text: String
    let color: Color
    
    @Binding var showSheet: Bool
    @Binding var imageToRender: Images
    
    var columns: [GridItem] {
        // iPad ?
        if UIDevice
            .current
            .userInterfaceIdiom == .pad {
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        } else {    // iPhone
            return [
                GridItem(.flexible()),
            ]
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(Images.allCases, id: \.self) { img in
                    let theImage = TheImageView(img: img, text: text, color: color, fractionOfScreen: UIDevice.current.userInterfaceIdiom == .pad ? 1/3 : 1)
                    
                    theImage
                        .onTapGesture {
                            imageToRender = img
                            showSheet.toggle()
                        }
                }
            }
        }
    }
}

struct GridImagesView_Previews: PreviewProvider {
    static var previews: some View {
        GridImagesView(text: "The goal of this course is to cover as many topics as possible in SwiftUI for iOS 16. We will learn how to create apps that adapt to iPad and iPhone, support light and dark mode, grab data off the internet, learn about state, binding, work with animation and various views like sheets, sharelinks, forms, sliders, buttons, color pickers. Enjoy the course and happy programming", color: whiteColor,
           showSheet: .constant(false),
           imageToRender: .constant(.img1)
        )
    }
}
