//
//  LoaderButton.swift
//  Auction
//
//  Created by Dzmitry Semenovich on 18.01.22.
//

import Foundation
import SwiftUI

struct LoaderButton: View {
    struct Constants {
        static let enabledColor = Color.white
        static let disabledColor = Color.white.opacity(0.3)
    }

    var title: String
    var isEnabled: Bool
    var action: () -> Void

    @Binding var isLoading: Bool

    init(title: String,
         isEnabled: Bool = true,
         isLoading: Binding<Bool>,
         action: @escaping () -> Void) {
        self.title = title
        self.isEnabled = isEnabled
        self._isLoading = isLoading
        self.action = action
    }

    var body: some View {
        Button(
            action: {
                if isEnabled && !isLoading {
                    action()
                }
            },
            label: {
                LoadingView(isLoading: _isLoading, builder: {
                    Text(title)
                        .foregroundColor(isEnabled ? Constants.enabledColor : Constants.disabledColor)
                })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        )
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.brown)
            )
    }
}
