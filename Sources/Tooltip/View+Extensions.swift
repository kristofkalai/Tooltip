//
//  View+Extensions.swift
//
//
//  Created by Kristóf Kálai on 02/12/2023.
//

import SwiftUI

extension View {
    public func tooltip<Content: View>(
        configuration: TooltipConfiguration,
        tooltip: @escaping () -> Content
    ) -> some View {
        zIndex(configuration.zIndex)
            .onTapGesture {
                if !configuration.visible.wrappedValue || configuration.hideIfTappedOnAnchorView {
                    withAnimation(configuration.animation) {
                        configuration.visible.wrappedValue.toggle()
                    }
                }
            }
            .overlay {
                Tooltip(configuration: configuration, tooltip: tooltip)
            }
    }
}
