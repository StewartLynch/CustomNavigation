//
//  MenuViewModel.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var unselectedMenus:[MenuIcon] = [
        MenuIcon(color: .red, icon: "0.circle.fill", menuView: AnyView(Circle())),
        MenuIcon(color: .blue, icon: "1.circle.fill", menuView: AnyView(Text("Number 1 View"))),
        MenuIcon(color: .green, icon: "2.circle.fill", menuView: AnyView(Text("Number 2 View"))),
        MenuIcon(color: .orange, icon: "3.circle.fill", menuView: AnyView(Text("Number 3 View"))),
        MenuIcon(color: .yellow, icon: "4.circle.fill", menuView: AnyView(Text("Number 4 View")))
    ]
    
    @Published var selectedMenu: MenuIcon = MenuIcon(color: .pink, icon: "5.circle.fill", menuView: AnyView(Text("Number 5 View")))
}
