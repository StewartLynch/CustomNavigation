//
//  MenuViewModel.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var menus: [MenuItem] = [
        MenuItem(color: .red, icon: "house.fill", menuView: AnyView(HomeView()), selected: true),
        MenuItem(color: .blue, icon: "car.fill", menuView: AnyView(CarView()), selected: false),
        MenuItem(color: .green, icon: "map.fill", menuView: AnyView(RestaurantView()), selected: false),
//        MenuItem(color: .orange, icon: "4.circle.fill", menuView: AnyView(Text("Fourth View")), selected: false),
//        MenuItem(color: .yellow, icon: "5.circle.fill", menuView: AnyView(Text("Fifth View")), selected: false)
    ]
    
    var selectedMenu: MenuItem {
        guard let selected = menus.filter({$0.selected}).first  else {
            fatalError("You need to set one of the MenuItems in MenuViewModel.menus as selected: true")
        }
        return selected
    }
}
