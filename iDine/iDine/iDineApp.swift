//
//  iDineApp.swift
//  iDine
//
//  Created by Johel Zarco on 14/09/22.
//

import SwiftUI

@main
struct iDineApp: App {
    // order created at launch and live through app's lifecycle
    @StateObject var order = Order()
    // must conform to Observable protocol. Order.items will be the "publisher"
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order) // inject into contentView() in order to use it
        }
    }
}
