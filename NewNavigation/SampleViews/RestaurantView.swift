//
//  ThirdView.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct RestaurantView: View {
    var body: some View {
        let first = Restaurant(name: "Joe's Original")
        let second = Restaurant(name: "The Real Joe's Original")
        let third = Restaurant(name: "Original Joe's")
        let restaurants = [first, second, third]
        
        return
            NavigationView {
                List(restaurants) { restaurant in
                    RestaurantRow(restaurant: restaurant).padding()
                }
            .navigationBarTitle("Restaurants")
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView()
    }
}


struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}

struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}
