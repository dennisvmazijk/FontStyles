//
//  ContentView.swift
//  FontStyles
//
//  Created by Dennis van Mazijk on 2024/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fontStyles(for: .largeTitle), id: \.self) { style in
                        RowView(fontStyle: style)
                    }
                } header: {
                    headerView
                }

                Section {
                    ForEach(fontStyles(for: .title), id: \.self) { style in
                        RowView(fontStyle: style)
                    }
                } header: {
                    headerView
                }

                Section {
                    ForEach(fontStyles(for: .other), id: \.self) { style in
                        RowView(fontStyle: style)
                    }
                } header: {
                    headerView
                } footer: {
                    footerView
                }
            }
            .navigationTitle(Constants.navigationTitle)
            .toolbarTitleDisplayMode(.inline)
        }
    }

    private func fontStyles(for group: FontStyleGroup) -> [FontStyles] {
        switch group {
        case .largeTitle:
            return [.largeTitle]
        case .title:
            return [.title, .title2, .title3]
        case .other:
            return [.headline, .body, .callout, .subheadline, .footnote, .caption, .caption2]
        }
    }

    private var headerView: some View {
        HStack {
            Text(Constants.headerViewStyle)
            Spacer()
            Text(Constants.headerViewFont)
        }
    }

    private var footerView: some View {
        Text(Constants.footerViewDescription)
    }
}

struct RowView: View {
    let fontStyle: FontStyles

    var body: some View {
        HStack {
            Text(fontStyle.rawValue)
            Spacer()
            Text(fontStyle.size)
        }
        .font(fontStyle.textStyle)
    }
}

#Preview {
    ContentView()
}
