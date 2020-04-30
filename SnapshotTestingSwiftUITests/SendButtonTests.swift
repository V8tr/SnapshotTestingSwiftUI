//
//  SendButtonTests.swift
//  SnapshotTestingSwiftUITests
//
//  Created by Vadim Bulavin on 4/29/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SnapshotTestingSwiftUI

private let referenceSize = CGSize(width: 150, height: 50)

class SendButtonTests: XCTestCase {

    func testDefaultAppearance() {
        assertSnapshot(
            matching: SendButton().referenceFrame(),
            as: .image(size: referenceSize)
        )
    }
    
    func testRightToLeft() {
        let sut = SendButton()
            .referenceFrame()
            .environment(\.layoutDirection, .rightToLeft)
        
        assertSnapshot(matching: sut, as: .image(size: referenceSize))
    }
    
    func testRuLocale() {
        let sut = SendButton()
            .referenceFrame()
            .environment(\.locale, Locale(identifier: "RU"))

        assertSnapshot(matching: sut, as: .image(size: referenceSize))
    }
}

private extension SwiftUI.View {
    func referenceFrame() -> some View {
        self.frame(width: referenceSize.width, height: referenceSize.height)
    }
}
