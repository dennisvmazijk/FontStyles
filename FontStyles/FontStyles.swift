//
//  FontStyles.swift
//  FontStyles
//
//  Created by Dennis van Mazijk on 2024/05/23.
//

import SwiftUI

enum FontStyleGroup {
    case largeTitle
    case title
    case other
}

enum FontStyles: String {
    case largeTitle
    case title
    case title2
    case title3
    case headline
    case body
    case callout
    case subheadline
    case footnote
    case caption
    case caption2

    var textStyle: Font {
        let fontMap: [FontStyles: Font] = [
            .largeTitle: .largeTitle,
            .title: .title,
            .title2: .title2,
            .title3: .title3,
            .headline: .headline,
            .body: .body,
            .callout: .callout,
            .subheadline: .subheadline,
            .footnote: .footnote,
            .caption: .caption,
            .caption2: .caption2
        ]
        return fontMap[self, default: .body]
    }

    var size: String {
        "\(UIFont.preferredFont(from: textStyle).pointSize)"
    }
}

extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let style: UIFont.TextStyle

        switch font {
        case .largeTitle:
            style = .largeTitle
        case .title:
            style = .title1
        case .title2:
            style = .title2
        case .title3:
            style = .title3
        case .headline:
            style = .headline
        case .subheadline:
            style = .subheadline
        case .callout:
            style = .callout
        case .caption:
            style = .caption1
        case .caption2:
            style = .caption2
        case .footnote:
            style = .footnote
        default: // .body
            style = .body
        }
        return .preferredFont(forTextStyle: style)
    }
}
