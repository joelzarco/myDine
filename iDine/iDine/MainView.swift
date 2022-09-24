//
//  MainView.swift
//  iDine
//
//  Created by Johel Zarco on 23/09/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")// label allows text and images. Extra goodies
                }
            OrderView()
                .tabItem{
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
