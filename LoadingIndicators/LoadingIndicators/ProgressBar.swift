//
//  ProgressBar.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

/**
 * A view that creates a progress bar
 */

struct ProgressBar: View {
    /// A variable that creates timer publishing events on every 1 second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    /// A variable that tells the  width of the increasing progress capsule
    @State var width: CGFloat = 10
    
    /// A variable that tells by what amount the bar should progress
    @State var progress: CGFloat = 10
    
    /// A variable that tells the total width of the bar
    @State var capsuleWidth: CGFloat = 180
    
    var body: some View {
        ZStack {
            Capsule()
                .stroke(Color.gray)
                .frame(width: capsuleWidth, height: 20)
                .overlay(
                    VStack (alignment: .leading) {
                        Capsule()
                            .fill(Color.green)
                            .frame(width: self.width, height: 15, alignment: .leading)
                            .padding([.leading, .trailing], 5)
                            .animation(.linear(duration: 0.5))
                    }.frame(width: capsuleWidth, height: 20, alignment: .leading)
                ).onReceive(timer) { _ in
                    self.width += self.progress
                    if self.width >= self.capsuleWidth {
                        self.width = 0
                    }
                }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
