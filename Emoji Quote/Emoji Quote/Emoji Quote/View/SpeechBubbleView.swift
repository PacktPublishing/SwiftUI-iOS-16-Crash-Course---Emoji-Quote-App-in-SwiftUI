
import SwiftUI

struct SpeechBubbleShape: Shape {
    let radius: CGFloat
    let tailSize: CGFloat
        
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            // 1
            path.move( to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            
            // 2
            path.addLine( to: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2))
            
            // 3
            path
                .addCurve(
                    to: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2 - tailSize),
                    control1: CGPoint(x: rect.minX - tailSize, y: rect.maxY - rect.height / 2),
                    control2: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2 - tailSize / 2))

            // 4
            path
                .addArc(
                    center:  CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                    radius: radius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
            
            
            // 5
            path
                .addArc(
                    center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                    radius: radius,
                    startAngle: Angle(degrees: 270),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
            
            // 6
            path
                .addArc(
                    center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
            
            // 7
            path
                .addArc(
                    center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        }
    }
    
}

struct SpeechBubbleView: View {
    let text: String
    let color: Color
    let lineWidth: CGFloat
    let width: CGFloat
    let height: CGFloat
    let font: Font
    let fontWeight: Font.Weight
    
    var body: some View {
        SpeechBubbleShape(radius: 10, tailSize: 20)
            .stroke(color, lineWidth: lineWidth)
            .frame(width: width, height: height)
            .overlay(
            Text(text)
                .font(font)
                .fontWeight(fontWeight)
                .padding()
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
            )
    }
}

struct SpeechBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechBubbleView(
            text: "We cannot do everything at once, but we can do something at once.",
            color: .gray,
            lineWidth: 3,
            width: .infinity,
            height: 200,
            font: .title,
            fontWeight: .semibold)
        .padding()
    }
}
