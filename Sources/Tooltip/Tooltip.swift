//
//  Tooltip.swift
//
//
//  Created by Kristóf Kálai on 02/12/2023.
//

import SwiftUI

struct Tooltip<Content: View> {
    @Binding private var visible: Bool
    private let positionToAnchorView: Edge?
    private let animation: Animation?
    private let animationType: AnimationType
    private let tooltip: () -> Content
}

extension Tooltip {
    init(configuration: TooltipConfiguration, tooltip: @escaping () -> Content) {
        self.init(
            visible: configuration.visible,
            positionToAnchorView: configuration.positionToAnchorView,
            animation: configuration.animation,
            animationType: configuration.animationType,
            tooltip: tooltip
        )
    }
}

extension Tooltip: View {
    var body: some View {
        ZStack {
            switch animationType {
            case .fade:
                if visible {
                    content
                }
            case .scale:
                content
                    .scaleEffect(x: visible ? 1 : 0, y: visible ? 1 : 0, anchor: scaleAnchor)
            }
        }
    }
}

extension Tooltip {
    private var tooltipView: some View {
        tooltip()
            .fixedSize()
    }

    private var content: some View {
        GeometryReader { anchorViewProxy in
            tooltipView
                .hidden()
                .overlay {
                    offsettedContent(anchorViewProxy: anchorViewProxy)
                }
        }
    }

    private func offsettedContent(anchorViewProxy: GeometryProxy) -> some View {
        GeometryReader { proxy in
            tooltipView
                .offset(centerOffset(proxy: proxy, anchorViewProxy: anchorViewProxy))
                .offset(offset(proxy: proxy, anchorViewProxy: anchorViewProxy))
        }
    }
}

extension Tooltip {
    private var scaleAnchor: UnitPoint {
        switch positionToAnchorView {
        case .leading: .leading
        case .trailing: .trailing
        case .top: .top
        case .bottom: .bottom
        case nil: .center
        }
    }

    private func centerOffset(proxy: GeometryProxy, anchorViewProxy: GeometryProxy) -> CGSize {
        .init(width: -(proxy.size.width / 2) + (anchorViewProxy.size.width / 2),
              height: -(proxy.size.height / 2) + (anchorViewProxy.size.height / 2))
    }

    private func offset(proxy: GeometryProxy, anchorViewProxy: GeometryProxy) -> CGSize {
        switch positionToAnchorView {
        case .leading: .init(width: -proxy.size.width / 2 - anchorViewProxy.size.width / 2,
                             height: .zero)
        case .trailing: .init(width: proxy.size.width / 2 + anchorViewProxy.size.width / 2,
                              height: .zero)
        case .top: .init(width: .zero,
                         height: -proxy.size.height / 2 - anchorViewProxy.size.height / 2)
        case .bottom: .init(width: .zero,
                            height: proxy.size.height / 2 + anchorViewProxy.size.height / 2)
        case nil: .zero
        }
    }
}
