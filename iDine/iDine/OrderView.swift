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
                    .onDelete(perform: deleteItems) // swipeLeft gesture already built for us!
                }
                Section{
                    NavigationLink(destination : CheckOutView()){
                        Text("Place order")
                    }
                }// disable view of array isEmpty, no longer able to navigate to checkoutView
                .disabled(order.items.isEmpty)
            }
                .navigationTitle("Order")
                .listStyle(InsetGroupedListStyle())
                .toolbar{
                    EditButton()
                }
        }
    }
    // remove items to the view
    func deleteItems(at offsets : IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

//struct OrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderView()
//    }
//}
