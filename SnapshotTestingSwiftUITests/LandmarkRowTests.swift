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
    
    let landmark = Landmark(name: "Turtle Rock", imageName: "turtlerock", isFavorite: false)
    let favoriteLandmark = Landmark(name: "Turtle Rock", imageName: "turtlerock", isFavorite: true)

    func testRenderLandmark() {
        assertSnapshot(
            matching: LandmarkRow(landmark: landmark).referenceFrame(),
            as: .image(size: referenceSize)
        )
    }

    func testRenderFavorite() {
        assertSnapshot(
            matching: LandmarkRow(landmark: favoriteLandmark).referenceFrame(),
            as: .image(size: referenceSize)
        )
    }
}

private extension SwiftUI.View {
    func referenceFrame() -> some View {
        self.frame(width: referenceSize.width, height: referenceSize.height)
    }
}
