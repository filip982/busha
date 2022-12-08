//
//  SideMenu.swift
//  Busha
//
//  Created by Filip Miladinovic on 24.10.22.
//

import SwiftUI

struct SideMenu<Content: View>: View {
    // Constants
    private let sideBarWidth = UIScreen.main.bounds.size.width * 0.9
    private let backgroundColor = Color.white01
    private let backgroundBlackOpacity = 0.8

    // Dependencies
    let content: Content
    @Binding var showSidebar: Bool

    init(showSidebar: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._showSidebar = showSidebar
        self.content = content()
    }

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(backgroundBlackOpacity))
            .opacity(showSidebar ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: showSidebar)
            .onTapGesture {
                showSidebar.toggle()
            }

            HStack(alignment: .top) {
                ZStack(alignment: .top) {
                    backgroundColor

                    content
                        .padding(.top, type: .xxxxl)
                        .padding(.horizontal, type: .xxl)
                }
                .frame(width: sideBarWidth)
                .offset(x: showSidebar ? 0 : -sideBarWidth)
                .animation(.default, value: showSidebar)

                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}




struct MenuItem: Identifiable {
    var id: Int
    var icon: String
    var text: String
}

var userActions: [MenuItem] = [
    MenuItem(id: 4001, icon: "person.circle.fill", text: "My Account"),
    MenuItem(id: 4002, icon: "bag.fill", text: "My Orders"),
    MenuItem(id: 4003, icon: "gift.fill", text: "Wishlist"),
]

var profileActions: [MenuItem] = [
    MenuItem(id: 4004, icon: "wrench.and.screwdriver.fill", text: "Settings"),
    MenuItem(id: 4005, icon: "iphone.and.arrow.forward", text: "Logout"),
]


struct SideMenu_OLD: View {
    struct Constants {
        struct Colors {
            static let backgroundColor = Color.white
            static let menuIconTintColor = Color.green
            static let menuTextColor = Color.black
        }
        static let sideBarWidth = UIScreen.main.bounds.size.width * 0.9
    }

    @Binding var isSidebarVisible: Bool

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }

            content
        }
        .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                Constants.Colors.backgroundColor

                VStack(alignment: .leading, spacing: 20) {
                    userProfile
                    Divider()
                    MenuLinks(items: userActions)
                    Divider()
                    MenuLinks(items: profileActions)
                }
                .padding(.top, 80)
                .padding(.horizontal, 40)
            }
            .frame(width: Constants.sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -Constants.sideBarWidth)
            .animation(.default, value: isSidebarVisible)

            Spacer()
        }
    }

    var userProfile: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: "https://picsum.photos/100")) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.blue, lineWidth: 2)
                        }
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(3 / 2, contentMode: .fill)
                .shadow(radius: 4)
                .padding(.trailing, 18)

                VStack(alignment: .leading, spacing: 6) {
                    Text("John Doe")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                    Text(verbatim: "john@doe.com")
                        .foregroundColor(Constants.Colors.menuTextColor)
                        .font(.caption)
                }
            }
            .padding(.bottom, 20)
        }
    }

    struct MenuLinks: View {
        var items: [MenuItem]
        var body: some View {
            VStack(alignment: .leading, spacing: 30) {
                ForEach(items) { item in
                    menuLink(icon: item.icon, text: item.text)
                }
            }
            .padding(.vertical, 14)
            .padding(.leading, 8)
        }
    }

    struct menuLink: View {
        var icon: String
        var text: String
        var body: some View {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Constants.Colors.menuTextColor)
                    .padding(.trailing, 18)
                Text(text)
                    .foregroundColor(Constants.Colors.menuTextColor)
                    .font(.body)
            }
            .onTapGesture {
                print("Tapped on \(text)")
            }
        }
    }
}


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isPushingView: .constant(false))
    }
}
