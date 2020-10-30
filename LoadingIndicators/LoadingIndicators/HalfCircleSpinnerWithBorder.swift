//
//  HalfCircleSpinnerWithBorder.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

/**
 * A view that creates a loading indicator in 2 half circular arcs form  in a circular ring..
 * These arcs indicating loading rotate in circular motion.
 * Use liner animation for continuously smooth animation on arc.
 * Use default animation for continuously faster animation having a little stop at the end.
 * Use easeIn/ easeOut/ easeInOut for continuously smooth animation having stop at the end.
 * You can add delay with required duration if you want to stop longer before next animation cycle starts.
 */
struct HalfCircleSpinnerWithBorder: View {
    /// A variable to tell the stroke style
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    
    /// A variable to tell whether indicator is loading or not
    @State var animate = false
    
    /// A variable to tell the color of the indicator
    let color = Color.green
    
    var body: some View {
        ZStack {
            // This section creates the circular border ring
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 15)
                .frame(width: 100, height: 100)
            
            // This portion creates & animates the first arc
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [color]), center: .center),
                    style: style
                )
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(
                    Animation.linear(duration: 0.7)
                        .repeatForever(autoreverses: false)
                )
            
            // This portion creates & animates the second arc.
            Circle()
                .trim(from: 0.5, to: 0.7)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [color]), center: .center),
                    style: style
                )
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(
                    Animation.linear(duration: 0.7)
                        .repeatForever(autoreverses: false)
                )
        }.onAppear() {
            self.animate.toggle()
        }
    }
}

struct HalfCircleSpinnerWithBorder_Previews: PreviewProvider {
    static var previews: some View {
        HalfCircleSpinnerWithBorder()
    }
}
