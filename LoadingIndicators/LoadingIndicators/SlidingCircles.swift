//
//  SlidingCircles.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

/**
 * A view that creates a indicator in form of sliding circles
 */
struct SlidingCircles: View {
    /// A variable that creates timer publishing events on every 1 second
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    /// A variable that defined the left offset
    @State var leftOffset: CGFloat = -100
    
    /// A variable that defined the right offset
    @State var rightOffset: CGFloat = 100
    
    /// A variable to tell the color of the circles
    let colorOfCircles = Color.green
    
    var body: some View {
        ZStack {
            // This section creates the 1st circle
            Circle()
                .fill(colorOfCircles)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1))
            
            // This section creates the 2nd circle
            Circle()
                .fill(colorOfCircles)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.2))

            // This section creates the 3rd circle
            Circle()
                .fill(colorOfCircles)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.4))
            }
        .onReceive(timer) { (_) in
            swap(&self.leftOffset, &self.rightOffset)
        }
    }
    
}

struct SlidingCircles_Previews: PreviewProvider {
    static var previews: some View {
        SlidingCircles()
    }
}
