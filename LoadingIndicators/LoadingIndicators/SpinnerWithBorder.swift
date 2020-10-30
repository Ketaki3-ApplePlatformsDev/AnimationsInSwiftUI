//
//  ArcLoadIndicatorOnCircularBorder.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 25/10/20.
//

import SwiftUI

/**
 * A view that creates a loading indicator in arc form in a circular ring.
 * This arc indicating loading rotates in circular motion.
 * Use liner animation for continuously smooth animation on arc.
 * Use easeIn/ easeOut/ easeInOut for continuously smooth animation having stop at the end.
 * You can add delay with required duration if you want to stop longer before next animation cycle starts.
 */
struct SpinnerWithBorder: View {
    
    /// A variable to tell whether indicator is loading or not
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            
            // This section creates the circular border ring
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 20)
                .frame(width: 100, height: 100)
            
            // This section creates and animates the arc loader
            Circle()
                .trim(from: 0, to: 0.2) // for deciding length of the arc
                .stroke(Color.green, lineWidth: 10)  // for deciding width of the arc
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration:  1).repeatForever(autoreverses: false))  // sets the animation effect on arc
//                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
                
                .onAppear() {
                    self.isLoading.toggle()
                }
        }
    }
}

struct ArcLoadIndicatorOnCircularBorder_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerWithBorder()
    }
}
