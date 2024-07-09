//
//  ContentView.swift
//  Progress
//
//  Created by Fenuku kekeli on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var showFilter = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                FreelancerListView(searchText: $searchText)
            }
            .navigationBarTitle("Freelancers")
            .navigationBarItems(trailing: HStack {
                CurrencyButton()
                    
                FilterButton(showFilter: $showFilter)
            })
        }
        .sheet(isPresented: $showFilter) {
            FilterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

