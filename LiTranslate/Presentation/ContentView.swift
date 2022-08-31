//
//  ContentView.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var selection: LanguagesSelection = LanguagesSelection()
    @StateObject private var textData: TextData = TextData()
    @StateObject private var bookmarksData: BookmarksData = BookmarksData()
    @StateObject private var instance: InstanceURL = InstanceURL()

    @State private var tabSelection: Int = Numbers.one

    init() {
        let _ = UIPasteboard.general
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .environmentObject(selection)
                .environmentObject(textData)
                .environmentObject(bookmarksData)
                .environmentObject(instance)
                .tabItem {
                    Image(systemName: SystemNames.globe)
                    Text(Names.translateTabItemName)
                }
                .tag(Numbers.one)
            BookmarksView(tabSelection: $tabSelection)
                .environmentObject(selection)
                .environmentObject(textData)
                .environmentObject(bookmarksData)
                .tabItem {
                    Image(systemName: SystemNames.bookmarkFill)
                    Text(Names.bookmarksTabItemName)
                }
                .tag(Numbers.two)
            SettingsView()
                .environmentObject(instance)
                .tabItem {
                    Image(systemName: SystemNames.settings)
                    Text(Names.settingsTabItemName)
                }
                .tag(Numbers.three)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
