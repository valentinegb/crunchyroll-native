//
//  SearchView.swift
//  Crunchyroll Native
//
//  Created by Valentine Briese on 6/17/22.
//

import SwiftUI

struct SearchView: View {
    var searchText: String
    
    init(_ searchText: String) {
        self.searchText = searchText
    }
    
    var body: some View {
        Text(searchText)
            .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView("Lorem ipsum")
    }
}
