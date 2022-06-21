//
//  Crunchyroll_NativeView.swift
//  Crunchyroll Native
//
//  Created by Valentine Briese on 6/17/22.
//

import SwiftUI

struct Crunchyroll_NativeView: View {
    @State private var searchText = ""
    
    #if os(macOS)
    @State private var activeTab: Tab = .watchNow
    @State private var submittedSearchText = ""

    private enum Tab: String, CaseIterable, Identifiable {
        case watchNow, browse, search
        var id: Self { self }
    }

    var body: some View {
        VStack {
            switch activeTab {
            case .watchNow: WatchNowView()
            case .browse: BrowseView()
            case .search: SearchView(submittedSearchText)
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("Tab", selection: $activeTab) {
                    Text("Watch Now").tag(Tab.watchNow)
                    Text("Browse").tag(Tab.browse)
                }
                .pickerStyle(.segmented)
            }
            ToolbarItem {
                Spacer()
            }
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search, {
            submittedSearchText = searchText
            activeTab = .search
        })
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
    }
    #else
    var body: some View {
        TabView {
            NavigationStack {
                WatchNowView()
                    .navigationTitle("Watch Now")
            }
            .tabItem {
                Label("Watch Now", systemImage: "play.circle.fill")
            }
            NavigationStack {
                BrowseView()
                    .navigationTitle("Browse")
            }
            .tabItem {
                Label("Browse", systemImage: "square.grid.2x2.fill")
            }
            NavigationStack {
                SearchView()
                    .navigationTitle("Search")
                    .searchable(text: $searchText)
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
    #endif
}

struct Crunchyroll_NativeView_Previews: PreviewProvider {
    static var previews: some View {
        Crunchyroll_NativeView()
    }
}
