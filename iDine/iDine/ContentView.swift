//
//  ContentView.swift
//  iDine
//
//  Created by Johel Zarco on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    // decode menu.json with helper
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        
        NavigationView{
            List{
                ForEach(menu){ section in // as in closure
                    // SwitUI already has a section/header functionality ready to use
                    Section(header : Text(section.name)){
                        ForEach(section.items){ item in
//                            Text(item.name)
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu")// applied to List
            // .listStyle() no longer available to List() as shown in tutorial
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
