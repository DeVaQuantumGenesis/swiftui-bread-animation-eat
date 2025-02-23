// Made by DeVa CEO Naoki Takehara

import SwiftUI

struct SplitButtonView: View {
    @State private var isSplit = false
    @State private var shakeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.blue
            .ignoresSafeArea()
            HStack(spacing: isSplit ? 20 : 0) {
                ButtonPart(isLeft: true)
                    .offset(x: isSplit ? -50 : 0)
                    .scaleEffect(isSplit ? 0.95 : 1)
                    .offset(x: shakeOffset)
                
                ButtonPart(isLeft: false)
                    .offset(x: isSplit ? 50 : 0)
                    .scaleEffect(isSplit ? 0.95 : 1)
                    .offset(x: -shakeOffset)
            }
            .animation(.easeInOut(duration: 0.3), value: isSplit)
        }
        .frame(width: 200, height: 60)
        .onTapGesture {
            withAnimation {
                isSplit.toggle()
            }
            if isSplit {
                startShaking()
            }
        }
    }
    
    func startShaking() {
        let shakeAmount: CGFloat = 10
        withAnimation(Animation.easeInOut(duration: 0.1).repeatCount(3, autoreverses: true)) {
            shakeOffset = shakeAmount
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                shakeOffset = 0
            }
        }
    }
}

struct ButtonPart: View {
    let isLeft: Bool
    
    var body: some View {
        Rectangle()
            .foregroundStyle(.ultraThinMaterial)
            .frame(width: 90, height: 60)
            .cornerRadius(15)
          //.clipShape(TearShape())
    }
}


struct ContentView: View {
    var body: some View {
        SplitButtonView()
    }
}
