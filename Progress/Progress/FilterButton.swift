//
//  FilterButton.swift
//  Progress
//
//  Created by Fenuku kekeli on 7/8/24.
//

import SwiftUI

struct FilterButton: View {
    @Binding var showFilter: Bool
    
    var body: some View {
        Button(action: {
            showFilter.toggle()
        }) {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.blue)
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(showFilter: .constant(false))
    }
}
