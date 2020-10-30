//
//  LoadingText.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

/**
 * A view that creates a animated loading text.
 */
struct LoadingText: View {
    /// A variable to tells how many dots to append
    @State var dotsToShow = ""
    
    /// A variable that creates timer publishing events on every 1 second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("Loading \(dotsToShow)")
            .font(.system(size: 20)).bold()
            .transition(.slide)
            .onReceive(timer, perform: { _ in
            if self.dotsToShow.count == 3 {
                self.dotsToShow = ""
            } else {
                self.dotsToShow += "."
            }
        }).onAppear() {
            self.dotsToShow = "."
        }
    }
}

struct LoadingText_Previews: PreviewProvider {
    static var previews: some View {
        LoadingText()
    }
}
