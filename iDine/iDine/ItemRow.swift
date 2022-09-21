//
//  ItemRow.swift
//  iDine
//
//  Created by Johel Zarco on 20/09/22.
//

import SwiftUI

struct ItemRow: View {
    let item : MenuItem
    // label color for special ingredients
    let colors : [String : Color] = ["D" : .purple, "G" : .black, "N" : .red, "S" : .blue, "V" : .green]
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))// nice thin outer gray circle
            
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")

            }
            // In order to move restriction icon to the left we use spacer()
            Spacer()
            // still inside HStack
            // String must be identifiable, the string itself is unique and ident. IT'S weird!!!
            ForEach(item.restrictions, id : \.self){ restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)// 5 in order to be smaller; 
                    .background(colors[restriction])// default case missing as in tutorial?
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
            }
        }
    }
}

//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRow()
//    }
//}
