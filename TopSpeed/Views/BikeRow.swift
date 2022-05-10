//
//  BikeRow.swift
//  TopSpeed
//
//  Created by Cooper Standard on 5/6/22.
//

import SwiftUI

struct BikeRow: View {
    var bikeID: String
    var name: String

    var body: some View {
        HStack {
            Image("blankProfile")
                .resizable()
                .frame(width: 50, height: 50)
            Text(bikeID)

            Spacer()
        }
    }
}

struct BikeRow_Previews: PreviewProvider {
    static var previews: some View {
        BikeRow(bikeID: "1", name: "Manufacturer-year")
    }
}
