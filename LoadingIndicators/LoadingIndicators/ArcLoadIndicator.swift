//
//  ArcLoadIndicator.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 25/10/20.
//

import SwiftUI

/**
 * A view that creates a loading indicator in arc form.
 * This arc indicating loading rotates in circular motion.
 * Use liner animation for continuously smooth animation on arc.
 * Use default animation for continuously faster animation having a little stop at the end.
 * Use easeIn/ easeOut/ easeInOut for continuously smooth animation having stop at the end.
 * You can add delay with required duration if you want to stop longer before next animation cycle starts.
 */

struct ArcLoadIndicator: View {
    /// A variable to tell whether indicator is loading or not
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.1) // for deciding length of the arc
            .stroke(Color.green, lineWidth: 5) // for deciding width of the arc
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
//            .animation(Animation.default.repeatForever(autoreverses: false))
//            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
            .onAppear() {
                self.isLoading = true
            }
    }
}

struct ArcLoadIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ArcLoadIndicator()
    }
}
