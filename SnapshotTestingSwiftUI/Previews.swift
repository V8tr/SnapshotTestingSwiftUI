//
//  Previews.swift
//  SnapshotTestingSwiftUI
//
//  Created by Vadim Bulavin on 4/28/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct LocalePreview<Preview: View>: View {
    private let preview: Preview
    
    var body: some View {
        ForEach(Locale.all, id: \.self) { locale in
            self.preview
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName("Locale: \(locale.identifier)")
        }
    }

    init(@ViewBuilder builder: @escaping () -> Preview) {
        preview = builder()
    }
}

// From https://www.avanderlee.com/swiftui/previews-different-states/
extension Locale {
    static let all = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
}

struct DarkThemePreview<Preview: View>: View {
    private let preview: Preview
    
    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark Theme")
    }

    init(@ViewBuilder builder: @escaping () -> Preview) {
        preview = builder()
    }
}

struct RightToLeftPreview<Preview: View>: View {
    private let preview: Preview
    
    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .environment(\.layoutDirection, .rightToLeft)
            .previewDisplayName("Right to Left")
    }

    init(@ViewBuilder builder: @escaping () -> Preview) {
        preview = builder()
    }
}

struct ContentSizeCategoryPreview<Preview: View>: View {
    private let preview: Preview
    private let sizeCategory: ContentSizeCategory
    
    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .environment(\.sizeCategory, sizeCategory)
            .previewDisplayName("Content Size Category: \(sizeCategory)")
    }

    init(_ sizeCategory: ContentSizeCategory, @ViewBuilder builder: @escaping () -> Preview) {
        self.sizeCategory = sizeCategory
        preview = builder()
    }
}

struct FontPreview<Preview: View>: View {
    private let preview: Preview
    private let font: Font
    
    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .environment(\.font, font)
            .previewDisplayName("Font")
    }

    init(_ font: Font, @ViewBuilder builder: @escaping () -> Preview) {
        self.font = font
        preview = builder()
    }
}
