//
//  ScalingCircles.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

/**
 * A view that creates a indicator in form of scaling / blinking circles
 */
struct ScalingCircles: View {
    /// A variable to indicate whether the circles should animate
    @State private var shouldAnimate = false
    
    /// A variable to tell the color of the circles
    let colorOfCircles = Color.green
    
    var body: some View {
        HStack {
            // This section creates & animates the 1st circle
            Circle()
                .fill(colorOfCircles)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever())
            
            // This section creates & animates the 2nd circle
            Circle()
                .fill(colorOfCircles)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.2))
            
            // This section creates & animates the 3rd circle
            Circle()
                .fill(colorOfCircles)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.4))
        }
        .onAppear {
            self.shouldAnimate = true
        }
    }
}

struct ScalingCircles_Previews: PreviewProvider {
    static var previews: some View {
        ScalingCircles()
    }
}
