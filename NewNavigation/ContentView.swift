//
//  ContentView.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-17.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var activate:Bool = true
    @ObservedObject var menuVM = MenuViewModel()
    var body: some View {
        ZStack {
            menuVM.selectedMenu.menuView
            ZStack {
                Color.black.opacity(activate ? 0 : 0.2)
                VStack() {
                    Spacer()
                    ZStack {
                        ForEach(0..<menuVM.menus.count) { i in
                            MenuCircle(activate: self.$activate,
                                       menuVM: self.menuVM,
                                       menuItem: self.menuVM.menus[i],
                                       index: i)
                        }
                        SelectedMenu(activate: self.$activate,
                                     menuItem: menuVM.selectedMenu)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(activate ? .horizontal : .all)
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









