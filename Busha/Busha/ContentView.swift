//
//  ContentView.swift
//  Busha
//
//  Created by Filip Miladinovic on 21.12.20.
//

import SwiftUI

extension ContentView {
    enum Tab: Hashable {
        case invite
        case jobs
        case dashboard
        case profile
        case news
        case unselected
    }
}

struct ContentView: View {
    @Binding var isPushingView: Bool
    @State var isSideBarOpened = false
    @State var pushActive = false
    @State var selectedTab: Tab = .invite

    var body: some View {
        ZStack {
            NavigationStack_ {
                TabView(selection: $selectedTab) {
                    Text("Invite Screen")
                        .tabItem {
                            Image(systemName: "briefcase.fill")
                            Text("invite") }
                        .tag(Tab.invite)
                    Text("Jobs Screen")
                        .tabItem {
                            Image(systemName: "briefcase.fill")
                            Text("jobs") }
                        .tag(Tab.jobs)
                    Text("Dashboard Screen")
                        .tabItem {
                            Image(systemName: "briefcase.fill")
                            Text("dashboard") }
                        .tag(Tab.dashboard)
                    Text("Profile Screen")
                        .tabItem {
                            Image(systemName: "briefcase.fill")
                            Text("profile") }
                        .tag(Tab.profile)
                    Text("News Screen")
                        .tabItem {
                            Image(systemName: "briefcase.fill")
                            Text("news") }
                        .tag(Tab.news)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(role: ButtonRole.destructive) {
                            isSideBarOpened.toggle()
                        } label: {
                            Label("Toggle SideBar", systemImage: "line.3.horizontal.circle.fill")
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(role: ButtonRole.destructive) {
                            debugPrint("🏀 🏀 🏀")
                            isPushingView.toggle()
                            debugPrint("\(pushActive)")
                        } label: {
                            Label("Toggle SideBar", systemImage: "line.3.horizontal.circle")
                        }
                    }
                }
            }
//            .navigationDestination(for: String.self) { text in
//                Text("Text \(text)")
//            }
            SideMenu(showSidebar: $isSideBarOpened) {
                SideMenuView()
            }
        }
    }
//    var body: some View {
//        ZStack {
//            NavigationView {
//                GeometryReader { dimensions in
//                    List {
//                        ForEach(0..<8) { _ in
//                            AsyncImage(url: URL(string: "https://picsum.photos/600")) { image in
//                                image
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(height: 240)
//                            } placeholder: {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 12)
//                                        .fill(.gray.opacity(0.6))
//                                        .frame(height: 240)
//                                    ProgressView()
//                                }
//                            }
//                            .aspectRatio(3 / 2, contentMode: .fill)
//                            .cornerRadius(12)
//                            .padding(.vertical)
//                            .shadow(radius: 4)
//                        }
//                    }
//                    .toolbar {
//                        ToolbarItemGroup(placement: .navigationBarLeading) {
//                            Button(role: ButtonRole.destructive) {
//                                isSideBarOpened.toggle()
//                            } label: {
//                                Label("Toggle SideBar", systemImage: "line.3.horizontal.circle.fill")
//                            }
//                        }
//                    }
//                    .listStyle(.inset)
//                    .navigationTitle("Home")
//                    .navigationBarTitleDisplayMode(.inline)
//                }
//            }
//            SideMenu(showSidebar: $isSideBarOpened) {
//                Text("SideBar opens here")
//                    .padding(.all, 20)
//                    .background(Color.yellow)
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isPushingView: .constant(false))
    }
}

struct NavigationStack_<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content

    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
        } else {
            NavigationView(content: content)
        }
    }
}
