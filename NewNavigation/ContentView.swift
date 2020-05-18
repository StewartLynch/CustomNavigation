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
                        ForEach(0..<menuVM.unselectedMenus.count) { i in
                            MenuCircle(activate: self.$activate, menuVM: self.menuVM, menuIcon: self.menuVM.unselectedMenus[i], index: i)
                        }
                        SelectedMenu(activate: self.$activate,
                                     menuIcon: menuVM.selectedMenu)
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









