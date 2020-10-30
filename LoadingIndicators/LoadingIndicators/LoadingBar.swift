//
//  LinearLoadingIndicator.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 25/10/20.
//

import SwiftUI

/**
 * A view that creates a loading bar
 */
struct LoadingBar: View {
    
    /// A variable to tell whether indicator is loading or not
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            // This section creates the gray bar on which the green line  indicating loading moves
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.systemGray5), lineWidth: 5)
                .frame(width: 250, height: 5)
            
            // This section creates and animates the green line indicating loading
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 25, height: 5)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
//                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            
        }
        .onAppear() {
            self.isLoading.toggle()
        }
    }
}

struct LinearLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBar()
    }
}
