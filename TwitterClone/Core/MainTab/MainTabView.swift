//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Ömürcan Cengiz on 15.12.2022.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView().onTapGesture {
                self.selectedIndex = 0
            }.tabItem() {
                Image(systemName: "house")
            }.tag(0).onAppear {
                appState.navTitle = "Home"
            }
            
            ExploreView().onTapGesture {
                self.selectedIndex = 1
            }.tabItem() {
                Image(systemName: "magnifyingglass")
            }.tag(1).onAppear {
                appState.navTitle = "Explore"
            }
            
            NotificationsView().onTapGesture {
                self.selectedIndex = 2
            }.tabItem() {
                Image(systemName: "bell")
            }.tag(2).onAppear {
                appState.navTitle = "Notifications"
            }
            
            MessagesView().onTapGesture {
                self.selectedIndex = 3
            }.tabItem() {
                Image(systemName: "envelope")
            }.tag(3).onAppear {
                appState.navTitle = "Messages"
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
