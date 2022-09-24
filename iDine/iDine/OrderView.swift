//
//  OrderView.swift
//  iDine
//
//  Created by Johel Zarco on 23/09/22.
//

import SwiftUI

struct OrderView: View {
    /*
     With the ObservableObject protocol we’ve given our Order class the ability to announce that it has changed, and we can now make SwiftUI watch for those announcements and reload the UI.
     */
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section{
                    NavigationLink(destination : Text("Check out")){
                        Text("Place order")
                    }
                }
            }.navigationTitle("Order")
                .listStyle(InsetGroupedListStyle())
        }
    }
}

//struct OrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderView()
//    }
//}
