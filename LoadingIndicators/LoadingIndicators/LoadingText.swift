//
//  LoadingText.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 30/10/20.
//

import SwiftUI

struct LoadingText: View {
    @State var dotsToShow = ""
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
