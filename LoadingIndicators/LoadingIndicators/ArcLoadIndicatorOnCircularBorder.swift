//
//  ArcLoadIndicatorOnCircularBorder.swift
//  LoadingIndicators
//
//  Created by Ketaki Mahaveer Kurade on 25/10/20.
//

import SwiftUI

struct ArcLoadIndicatorInCircularBorder: View {
    @State private var isLoading = false
     
        var body: some View {
            ZStack {
     
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 14)
                    .frame(width: 100, height: 100)
     
                Circle()
                    .trim(from: 0, to: 0.1)
                    .stroke(Color.green, lineWidth: 5)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.isLoading = true
                }
            }
        }
}

struct ArcLoadIndicatorOnCircularBorder_Previews: PreviewProvider {
    static var previews: some View {
        ArcLoadIndicatorInCircularBorder()
    }
}
