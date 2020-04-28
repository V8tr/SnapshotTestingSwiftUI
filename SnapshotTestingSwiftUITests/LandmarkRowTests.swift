//
//  LandmarkRowTests.swift
//  SnapshotTestingSwiftUITests
//
//  Created by Vadim Bulavin on 4/28/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SnapshotTestingSwiftUI

private let referenceSize = CGSize(width: 300, height: 70)

class LandmarkRowTests: XCTestCase {

    func testRenderLandmarkContent() {
        assertSnapshot(
            matching: LandmarkRow(landmark: .fixture()).referenceFrame(),
            as: .image(size: referenceSize)
        )
    }

    func testRenderFavorite() {
        assertSnapshot(
            matching: LandmarkRow(landmark: .fixture(isFavorite: true)).referenceFrame(),
            as: .image(size: referenceSize)
        )
    }
    
    func testLocalization() {
        let sut = LocalePreview { LandmarkRow(landmark: .fixture()) }
            .previewDevice(.iPhoneX)
        
        assertSnapshot(
            matching: sut,
            as: .image(on: .iPhoneX)
        )
    }
    
    func testDarkTheme() {
        let sut = DarkThemePreview { LandmarkRow(landmark: .fixture()) }
            .referenceFrame()
        
        assertSnapshot(
            matching: sut,
            as: .image(size: referenceSize)
        )
    }
    
    func testRightToLeft() {
        let sut = RightToLeftPreview { LandmarkRow(landmark: .fixture()) }
            .referenceFrame()
        
        assertSnapshot(
            matching: sut,
            as: .image(size: referenceSize)
        )
    }
    
    func testLargeTitleFont() {
        let sut = FontPreview(.largeTitle) { LandmarkRow(landmark: .fixture()) }
            .referenceFrame()
        
        assertSnapshot(
            matching: sut,
            as: .image(size: referenceSize)
        )
    }
}

private extension SwiftUI.View {
    func referenceFrame() -> some View {
        self.frame(width: referenceSize.width, height: referenceSize.height)
    }
}
