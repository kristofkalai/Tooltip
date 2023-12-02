//
//  TooltipConfiguration.swift
//
//
//  Created by Kristóf Kálai on 02/12/2023.
//

import SwiftUI

public struct TooltipConfiguration {
    let visible: Binding<Bool>
    let animation: Animation?
    let animationType: AnimationType
    let positionToAnchorView: Edge?
    let zIndex: Double
    let hideIfTappedOnAnchorView: Bool

    public init(
        visible: Binding<Bool>,
        animation: Animation? = .default,
        animationType: AnimationType = .fade,
        positionToAnchorView: Edge? = nil,
        zIndex: Double = 1,
        hideIfTappedOnAnchorView: Bool = false
    ) {
        self.visible = visible
        self.animation = animation
        self.animationType = animationType
        self.positionToAnchorView = positionToAnchorView
        self.zIndex = zIndex
        self.hideIfTappedOnAnchorView = hideIfTappedOnAnchorView
    }
}
