
import SwiftUI

struct ButtonsExampleView: View {
    
    @State private var glowing = true
    
    var body: some View {
        VStack {
            Text("Buttons")
                .font(.largeTitle)
            .fontWeight(.bold)
            
            Spacer()
            
            // Buttons
            VStack(spacing: 30) {
                Button(action: {
                    print("Button 1 pressed")
                }, label: {
                    Text("Button 1")
                        .foregroundColor(.red)
                        .padding()
                        .background(
                        Capsule()
                            .fill(Color
                                .black
                                .gradient)
                        )
                })
                
                Button(action: {
                    print("Button 2 pressed")
                }, label: {
                    Text("Button 2")
                        .foregroundColor(.black)
                        .padding()
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color
                                .purple
                                .gradient)
                            .shadow(color: .purple.opacity(0.5), radius: 5, x: 0, y: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.pink, lineWidth: 1)

                        )

                })
                
                Button(action: {
                    print("Button 3 pressed")
                }, label: {
                    Text("Button 3")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color
                                .blue
                                .gradient
                                .shadow(
                                    .inner(color: .pink.opacity(0.7), radius: 15, x: 0, y: 0 )
                                )
                                    .shadow(.drop(color: .black.opacity(0.5), radius: 5, x: 0, y: 5))
                            )
                        )
                })
                
                Button(action: {
                    print("Button 4 pressed")
                    withAnimation {
                        glowing.toggle()
                    }
                    
                }, label: {
                    ZStack {
                        Image(systemName: "doc.on.doc.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .clipShape(Circle())
                            .blur(radius: glowing ? 15 : 0)
                        
                        Image(systemName: "doc.on.doc.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    .overlay(
                    Circle()
                        .stroke(.black.opacity(0.9), lineWidth: 2)
                    )
                })
                
            }
            
            
        }.padding()
    }
}

struct ButtonsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsExampleView()
    }
}
