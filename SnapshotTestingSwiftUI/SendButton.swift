//
//  SendButton.swift
//  SnapshotTestingSwiftUI
//
//  Created by Vadim Bulavin on 4/27/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct SendButton: View {
    let onAction: () -> Void = {}
    
    var body: some View {
        Button(
            action: onAction,
            label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("common.button.send")
                }
        })
    }
}

struct SendButton_Preview: PreviewProvider {
    static var previews: some View {
        SendButton()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
