//
//  CurrencyButton.swift
//  Progress
//
//  Created by Fenuku kekeli on 7/8/24.
//

import SwiftUI

struct CurrencyButton: View {
    var body: some View {
        Button(action: {
            // Handle currency change
        }) {
            Text("ABD")
                .foregroundColor(.blue)
        }
    }
}

struct CurrencyButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyButton()
    }
}
