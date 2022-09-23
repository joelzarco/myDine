//
//  ItemDetail.swift
//  iDine
//
//  Created by Johel Zarco on 21/09/22.
//

import SwiftUI

struct ItemDetail: View {
    let item : MenuItem
    
    var body: some View {
        VStack{
            // to show photo credits, we use a Ztack
            ZStack(alignment : .bottomTrailing){
                Image(item.mainImage)
                    .resizable() // to fit in smaller screens
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)// first padd the text!
                    .background(Color.black)// order matters
                    .font(.caption)
                    .foregroundColor(.white)
                // to offeset the text from the bottom edge of the image
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Spacer()// to move everything to the top
        }.navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline) // in order to be smaller and meet apple's HIG
    }
}

//struct ItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetail()
//    }
//}
