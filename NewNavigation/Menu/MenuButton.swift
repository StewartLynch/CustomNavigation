//
//  MenuButton.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    @Binding var isActivated:Bool
    @ObservedObject var menuVM:MenuViewModel
    var menuItem:MenuItem
    var index: Int {
        return menuVM.menus.firstIndex{$0.id == menuItem.id}!
    }
    var body: some View {
        Circle()
            .fill(menuItem.color)
            .frame(width: isActivated ? 50 : 20, height: isActivated ? 50 : 20)
        .shadow(radius: 5)
            .overlay(Image(systemName:menuItem.icon)
                .foregroundColor(.white)
        ).animation(.spring())
            .onTapGesture {
                self.updateSelected()
                self.isActivated.toggle()
        }.offset(x: isActivated ? calcOffset().x : 0, y:  isActivated ? calcOffset().y : -10)
    }
    
    func updateSelected() {
        for i in 0..<menuVM.menus.count {
            menuVM.menus[i].selected = menuVM.menus[i].id == menuItem.id
        }
    }
    

    
    func calcOffset() -> (x: CGFloat, y: CGFloat) {
        switch self.menuVM.menus.count {
        case 2:
            switch index {
            case 0:
                return (-70, -70)
            default:
                return (70, -70)
            }
        case 3:
            switch index {
            case 0:
                return (-70,-70)
            case 1:
                return (0, -110)
            default:
                return (70, -70)
            }
        case 4:
            switch index {
            case 0:
                return (-90,-40)
            case 1:
                return (45,-110)
            case 2:
                return (45,-110)
            default:
                return (90,-40)
            }
        default:  // 5 unselected
            switch index {
            case 0:
                return (-100,-20)
            case 1:
                return (-70,-80)
            case 2:
                return (0,-110)
            case 3:
                return (70, -80)
            default:
                return (100,-20)
            }
        }
    }
}

struct SelectedMenu : View {
    @Binding var isActivated:Bool
    var menuItem:MenuItem
    var body: some View {
        Circle()
            .fill(menuItem.color)
            .frame(width: isActivated ? 50 : 65, height: isActivated ? 50 : 65)
            .shadow(radius: 5)
            .overlay(Image(systemName: menuItem.icon)
                .foregroundColor(.white))
            .onTapGesture {
                self.isActivated.toggle()
        }
        .animation(.spring())
        .offset(x: 0, y: isActivated ? -20 : -10)
    }
}
