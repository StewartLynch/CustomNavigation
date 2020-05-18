//
//  MenuViewModel.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var menus:[MenuItem] = [
        MenuItem(color: .red, icon: "house.fill", menuView: AnyView(HomeView()), selected: true),
        MenuItem(color: .blue, icon: "car.fill", menuView: AnyView(SecondView()), selected: false),
        MenuItem(color: .green, icon: "mappin.circle.fill", menuView: AnyView(ThirdView()), selected: false),
        MenuItem(color: .orange, icon: "3.circle.fill", menuView: AnyView(FourthView()), selected: false),
        MenuItem(color: .yellow, icon: "4.circle.fill", menuView: AnyView(FifthView()), selected: false)
    ]
    
    var selectedMenu:MenuItem {
        return menus.filter{$0.selected}.first!
    }

}
