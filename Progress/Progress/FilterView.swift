//
//  FilterView.swift
//  Progress
//
//  Created by Fenuku kekeli on 7/8/24.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack {
            Text("Filter Options")
                .font(.largeTitle)
                .padding()
            // Add your filter options here
            Spacer()
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
