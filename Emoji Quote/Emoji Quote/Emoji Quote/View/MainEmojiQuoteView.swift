
import SwiftUI

struct MainEmojiQuoteView: View {
    
    @StateObject var quoteViewModel: QuoteViewModel = QuoteViewModel()
    
    @State var showSheet: Bool = false
    @State var imageToRender: Images
    @State var quoteOfTheDay: String = "The goal of this course is to cover as many topics as possible in SwiftUI for iOS 16. We will learn how to create apps that adapt to iPad and iPhone, support light and dark mode, grab data off the internet, learn about state, binding, work with animation and various views like sheets, sharelinks, forms, sliders, buttons, color pickers. Enjoy the course and happy programming"
    
    @State var color: Color = whiteColor
    @State var scaleFactor: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
            redColor,
            yellowColor,
            orangeColor
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                HStack(spacing: 50) {
                    EmojiPerson(
                        imageName: ninja,
                        eyesName: ninjaEyes,
                        imageScale: 3,
                        eyesScale: 2,
                        offsetEyes: CGPoint(x: 0, y: -7))
                    .padding()
                    
                    SpeechBubbleView(
                        text: quoteOfTheDay,
                        color: .gray,
                        lineWidth: 3,
                        width: .infinity,
                        height: 200,
                        font: .title,
                        fontWeight: .semibold)
                    .onTapGesture {
                        quoteViewModel
                            .getRandomQuote()
                        
                        // Update quote of the day
                        quoteOfTheDay = quoteViewModel
                            .quoteModel
                            .content
                    }
                    .contextMenu {
                        Button(action: {
                            UIPasteboard
                                .general
                                .string = quoteOfTheDay
                        }, label: {
                            HStack {
                                Text("Copy to clipboard")
                                Image(systemName: "doc.on.doc")
                            }
                        })
                    }
                    
                    
                }
                .padding()

                Spacer()
                
                GridImagesView(
                    text: quoteOfTheDay,
                    color: color,
                showSheet: $showSheet,
                imageToRender: $imageToRender
                )
                
            }
            .padding()
        }
        .onAppear {
            quoteViewModel
                .getRandomQuote()
        }
        .sheet(isPresented: $showSheet) {
            ShareImageView(
                img: $imageToRender,
                text: $quoteOfTheDay,
                color: $color,
                showSheet: $showSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainEmojiQuoteView( imageToRender: .img1)
    }
}
