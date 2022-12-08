//
//  SideMenuView.swift
//  Busha
//
//  Created by Filip Miladinovic on 04.12.22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.teal)
                    .frame(width: 36, height: 36)
                Button("Settings") {

                }
            }
        }
        Text("SideBar opens here")
            .padding(.all, 20)
            .background(Color.yellow)

    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
