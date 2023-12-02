# Tooltip
Show a tooltip with a one-liner! 🗯️

## Details

This library's main goal is to provide an easy to use solution to show a tooltip for a given view. The actual implementation of the tooltip's UI is not included. However, the example app shows a basic one, that can help building your own one.

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/Tooltip", exact: .init(0, 0, 2))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

```swift
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
                .padding(26)
                .background(Color.red.opacity(0.3))
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
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/Tooltip/blob/main/Resources/screenrecording.gif?raw=true" width="50%" alt="Example"></p>
