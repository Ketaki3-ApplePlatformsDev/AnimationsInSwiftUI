//
//  ProgressCircle.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

/**
 * A view that creates a progress spinner
 */
struct ProgressCircleWithoutBorder: View {
    /// A variable that creates timer publishing events on every 1 second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    /// A variable to tell the stroke style
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    
    /// A variable to tell the color of the indicator
    let color = Color.green
    
    /// A variable that tells by what amount the bar should progress
    @State var progress: CGFloat = 0.0
    
    var body: some View {
      Circle()
        .trim(from: 0.0, to: progress)
        .stroke(
            AngularGradient(gradient: Gradient(colors: [color]), center: .center),
            style: style
        )
        .frame(width: 50, height: 50)
        .animation(.default)
        .onReceive(timer) { _ in
            self.progress += 0.1
            if self.progress >= 1 {
                self.progress = 0
            }
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleWithoutBorder()
    }
}
