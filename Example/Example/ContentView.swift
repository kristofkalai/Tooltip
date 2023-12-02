//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 02/12/2023.
//

import SwiftUI
import Tooltip

struct ContentView: View {
    @State private var visible = false
    private let animation: Animation? = .default

    var body: some View {
        VStack {
            Text("First text")
                .padding(32)
                .background(Color.green.opacity(0.3))
                .tooltip(configuration: .init(
                    visible: $visible,
                    animation: animation,
                    animationType: .scale,
                    positionToAnchorView: .bottom,
                    zIndex: 1,
                    hideIfTappedOnAnchorView: true
                )) {
                    Text("Tooltip")
                        .offset(y: 4)
                        .padding(8)
                        .padding(.vertical, 8)
                        .background {
                            VStack(spacing: .zero) {
                                Triangle()
                                    .fill(Color.green.opacity(0.3))
                                    .frame(width: 10, height: 8)

                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.green.opacity(0.3))
                            }
                            .drawingGroup()
                        }
                        .background(Color.white)
                        .onTapGesture {
                            if visible {
                                withAnimation(animation) {
                                    visible.toggle()
                                }
                            }
                        }
                }
            Text("Second text")
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

#Preview {
    ContentView()
}
