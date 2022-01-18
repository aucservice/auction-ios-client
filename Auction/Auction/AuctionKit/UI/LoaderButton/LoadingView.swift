//
//  LoadingView.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SwiftUI

public struct LoadingView<Content: View>: View {
    var colorScheme: ColorScheme
    @Binding var isLoading: Bool

    let content: Content

    public init(colorScheme: ColorScheme = .dark, isLoading: Binding<Bool>, @ViewBuilder builder: () -> Content) {
        self.colorScheme = colorScheme
        self._isLoading = isLoading
        content = builder()
    }

    public var body: some View {
        ZStack {
            if isLoading {
                ProgressIndicator(colorScheme: colorScheme)
            } else {
                content.animation(.none)
            }
        }
    }
}
