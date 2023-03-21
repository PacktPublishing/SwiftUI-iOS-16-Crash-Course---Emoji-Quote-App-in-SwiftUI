
import SwiftUI

struct ShareImageView: View {
    @Binding var img: Images
    @Binding var text: String
    @Binding var color: Color
    @Binding var showSheet: Bool
    
    var sectionFont: Font {
        UIDevice
            .current
            .userInterfaceIdiom == .pad ? .largeTitle : .headline
    }
    
    let defaultFractionOfScreen: CGFloat = UIDevice
        .current
        .userInterfaceIdiom == .pad ? 1/3 : 1
    
    @State private var fractionOfScreen:  CGFloat = UIDevice
        .current
        .userInterfaceIdiom == .pad ? 1/3 : 1
    
    @State private var scaleText: CGFloat = 1.0
    
    var theImage: TheImageView {
        TheImageView(img: img, text: text, color: color, fractionOfScreen: fractionOfScreen,scaleText: scaleText)
    }
    
    @MainActor
    var imageForShareLink: Image {
        let renderer = ImageRenderer(content: theImage)
        
        if let image = renderer.cgImage {
            return Image(decorative: image, scale: 1.0)
        } else {
            return Image(systemName: "questionmark.app")
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .font(sectionFont)
                        .fontWeight(.bold)
                })
                .padding()
            }
            
            Form {
                Section(header: Text("Preview and Edit Image")
                    .font(sectionFont)
                    .fontWeight(.bold)
                ) {
                    HStack {
                        Spacer()
                        theImage
                        Spacer()
                    }
                    
                    ColorPicker(selection: $color, supportsOpacity: true, label: {
                        Text("Select Text Color")
                            .font(sectionFont)
                    })
                }
                
                
                Section(header: Text("Resize Image")
                    .font(sectionFont)
                    .fontWeight(.bold)
                ) {
                    HStack(spacing: 20) {
                        Slider(value: $fractionOfScreen, in: 0...1)
                        Button(action: {
                            withAnimation {
                                fractionOfScreen = defaultFractionOfScreen

                            }
                         }, label: {
                            Image(systemName: "arrow.uturn.backward.circle")
                                .font(sectionFont)
                        })
                    }
                }
                
                Section(header: Text("Resize Text")
                    .font(sectionFont)
                    .fontWeight(.bold)
                ) {
                    HStack(spacing: 20) {
                        Slider(value: $scaleText, in: 0...15)
                        Button(action: {
                            withAnimation {
                                scaleText = 1.0

                            }
                         }, label: {
                            Image(systemName: "arrow.uturn.backward.circle")
                                .font(sectionFont)
                        })
                    }
                }

                
                Section(header: Text("Save or Share")
                    .font(sectionFont)
                    .fontWeight(.bold)
                ) {
                    Button(action: {
                        let renderer = ImageRenderer(content: theImage)
                        
                        if let image = renderer.uiImage {
                            renderer.scale = 3
                            
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
                    }, label: {
                        Label(
                            "Save to Photo Album",
                            systemImage: "photo")
                    })
                    
                    ShareLink("Share Image",
                      item: imageForShareLink,
                      subject: Text("Shared Image"),
                      message: Text("Here is a nice image"),
                      preview: SharePreview("Image", image: imageForShareLink)
                    )
                }
            }
            
        }
    }
}

struct ShareImageView_Previews: PreviewProvider {
    static var previews: some View {
        ShareImageView(img: .constant(.img1), text: .constant("Hello"), color: .constant(whiteColor), showSheet: .constant(true))
    }
}
