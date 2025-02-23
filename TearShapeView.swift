import SwiftUI

struct TearShape: Shape {
    let isLeft: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waveHeight: CGFloat = 8
        let waveWidth: CGFloat = rect.height / 5
        
        path.move(to: CGPoint(x: isLeft ? rect.width : 0, y: 0))
        
        for i in 0..<5 {
            let y = CGFloat(i) * waveWidth
            let controlX = isLeft ? rect.width - waveHeight : waveHeight
            let midY = y + waveWidth / 2
            path.addQuadCurve(to: CGPoint(x: isLeft ? rect.width : 0, y: midY), control: CGPoint(x: controlX, y: midY))
            path.addQuadCurve(to: CGPoint(x: isLeft ? rect.width : 0, y: y + waveWidth), control: CGPoint(x: controlX, y: y + waveWidth))
        }
        
        path.addLine(to: CGPoint(x: isLeft ? 0 : rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: isLeft ? rect.width : 0, y: rect.height))
        path.closeSubpath()  // ← ここを修正！
        
        return path
    }
}
