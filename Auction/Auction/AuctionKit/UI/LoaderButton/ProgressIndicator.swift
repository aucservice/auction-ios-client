//
//  ProgressIndicator.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SwiftUI

struct ProgressIndicator: View {
    @State var isLoading = false

    var colorScheme: ColorScheme

    var tintColor: Color {
        colorScheme == .light ? Color.brown : Color.white
    }

    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
            .foregroundColor(tintColor)
            .scaleEffect(CGSize(width: 1.3, height: 1.3))
            .onAppear {
                self.isLoading = true
            }
    }
}
