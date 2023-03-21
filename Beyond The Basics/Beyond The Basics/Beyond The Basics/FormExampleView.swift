//
//  FormExampleView.swift
//  Beyond The Basics
//
//  Created by Ron Erez on 12/11/22.
//

import SwiftUI

struct FormExampleView: View {
    @State private var alignmentIndex: Int = 1
    @State private var contentMode: ContentMode = .fill
    @State private var radius: CGFloat = 10.0
    @State private var imageName: String = "img0"
    @State private var text: String = "Welcome All !"
    @State private var textColor: Color = .white
    @State private var showText: Bool = true
    @State private var padding: CGFloat = 20.0
    
    let width = UIScreen.main.bounds.width
    var imageWidth: CGFloat {
        0.8 * width
    }
    
    let alignmentList: [Alignment] = [
        Alignment.leading, .center, .trailing
    ]
    
    let textAlignmentList: [TextAlignment] = [
        .leading, .center, .trailing
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("The Image") {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .cornerRadius(radius)
                        .clipShape(RoundedRectangle(cornerRadius: radius))
                        .padding()
                        .overlay(
                            Text(showText ? text : "")
                                .font(.title)
                                .fontWeight(.semibold)
                                .italic()
                                .foregroundColor(textColor)
                                .multilineTextAlignment(textAlignmentList[alignmentIndex])
                                .padding(padding)
                                .minimumScaleFactor(0.1)
                                .frame(width: imageWidth)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: alignmentList[alignmentIndex]
                                )
                            
                            
                        )
                        .onTapGesture {
                            imageName = randomImage()
                        }
                }
                
                if showText {
                    Section("Enter Text") {
                        HStack {
                            TextField("Text Name", text: $text)
                            
                            Button(action: {
                                text = [
                                    "An open door is a welcome that makes a stranger into a friend.",
                                    "A smile is a welcomed sight that invites people in.",
                                    "It's a welcomed gift to encourage others to achieve greatness.",
                                    "When struggles and challenges are holding you down, a simple welcoming hand toward you is all you need to lift you up.",
                                    "Welcome joy with an open heart and even more open mind.",
                                    "A genuine smile of welcome can take a bad day into a good one.",
                                    "Welcome to my heart! Let me open the door."
                                ]
                                    .randomElement() ?? ""
                            }, label: {
                                Image(systemName: "books.vertical.fill")
                            })
                        }
                        
                        Picker("", selection: $contentMode) {
                            Text("Fit")
                                .tag(ContentMode.fit)
                            
                            Text("Fill")
                                .tag(ContentMode.fill)
                        }
                        .pickerStyle(.segmented)
                    }
                }

                Section("Edit Options") {
                    HStack {
                        if showText {
                            VStack {
                                Picker("", selection: $alignmentIndex.animation()) {
                                    Image(systemName: "text.alignleft")
                                        .tag(0)
                                    
                                    Image(systemName: "text.aligncenter")
                                        .tag(1)
                                    
                                    Image(systemName: "text.alignright")
                                        .tag(2)
                                }
                                .pickerStyle(.segmented)
                                
                                Text("Select Alignment")
                                    .font(.caption)
                                    .fontWeight(.semibold)

                            }
                        }
                        
                        VStack(spacing: 3) {
                            Toggle(isOn: $showText.animation(), label: {})
                                .labelsHidden()
                            
                            Text("Toggle Text")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    VStack(spacing: 0) {
                        Text("Corner Radius")
                        Slider(value: $radius.animation(), in: 0...100)
                    }
                    
                    
                    if showText {
                        VStack(spacing: 0) {
                            Text("Text padding")
                            Slider(value: $padding.animation(), in: 0...50)
                        }
                        
                        HStack {
                            ColorPicker("Text Color",
                                        selection: $textColor.animation())
                            
                            Button(action: {
                                withAnimation {
                                    textColor = [
                                        .red,
                                        .blue,
                                        .green,
                                        .yellow,
                                        .pink,
                                        .black,
                                        .white,
                                        .purple,
                                        .indigo,
                                        .cyan
                                    ].randomElement() ?? .white
                                }
                                
                            }, label: {
                                Image(systemName: "paintpalette.fill")
                            })
                            
                            
                            
                        }
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Explore")
        }
    }
    
    func randomImage() -> String {
        let imageList = [
        "img0",
        "img1",
        "img2",
        "img3",
        "img4",
        "img5"
        ]

        return imageList.randomElement() ?? "img0"
    }
}

struct FormExampleView_Previews: PreviewProvider {
    static var previews: some View {
        FormExampleView()
    }
}
