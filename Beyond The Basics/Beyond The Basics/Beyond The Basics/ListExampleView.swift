
import SwiftUI

struct ListExampleView: View {
    let imageList = [
    "img0",
    "img1",
    "img2",
    "img3",
    "img4",
    "img5"
    ]
    @State private var showSheet = false
    @State private var selectedImage = ""
    
    var body: some View {
        List(imageList, id: \.self) { image in
            HStack {
                Image(image)
                    .resizable()
                    .cornerRadius(5)
                    .scaledToFit()
                    .frame(width: 80, height: 100)
                .shadow(radius: 10)
                .onTapGesture {
                    selectedImage = image
                    showSheet.toggle()
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Life is Amazing.")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("Nice Image")
                        .font(.subheadline)
                    Text("Enjoy your day")
                        .font(.caption)
                        .fontWeight(.thin)
                }.padding()
                
                
            }
        }
        .sheet(isPresented: $showSheet) {
            ShowImage(name: $selectedImage)
        }
    }
}

struct ShowImage: View {
    @Binding var name: String
    var body: some View {
        VStack {
            Text("Nice Image")
                .font(.largeTitle)
            Image(name)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
        }
    }
    
}

struct ListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ListExampleView()
    }
}
