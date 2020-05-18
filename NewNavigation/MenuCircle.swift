//
//  MenuCircle.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct MenuCircle: View {
    @Binding var activate:Bool
    @ObservedObject var menuVM:MenuViewModel
    var menuIcon:MenuIcon
    var index: Int
    var body: some View {
        Circle()
            .fill(menuIcon.color)
            .frame(width: 50, height: 50)
        .shadow(radius: 5)
            .overlay(Image(systemName:menuIcon.icon)
                .foregroundColor(.white)
        ).animation(.spring())
            .onTapGesture {
                self.swapSelected(index: self.index)
                self.activate.toggle()
        }.offset(x: activate ? 0 : calcOffset().0, y:  activate ? -10 : calcOffset().1)
    }
    
    func swapSelected(index:Int) {
        let oldSelected = menuVM.selectedMenu
        let newSelected = menuVM.unselectedMenus[index]
        menuVM.unselectedMenus[index] = oldSelected
        menuVM.selectedMenu = newSelected
    }
    
    func unselectedNames() -> String {
        return menuVM.unselectedMenus.map{$0.icon}.joined(separator: ", ")
    }
    func calcOffset() -> (CGFloat, CGFloat) {
        switch self.menuVM.unselectedMenus.count {
        case 1:
            return (0, -80)
        case 2:
            switch index {
            case 1:
                return (-60, -80)
            default:
                return (60, -80)
            }
        case 3:
            switch index {
            case 1:
                return (-80,-50)
            case 2:
                return (0, -100)
            default:
                return (80, -50)
            }
        case 4:
            switch index {
            case 1:
                return (-90,-20)
            case 2:
                return (-50,-90)
            case 3:
                return (50,-90)
            default:
                return (90,-20)
            }
        default:  // 5 unselected
            switch index {
            case 1:
                return (-100,-10)
            case 2:
                return (-70,-70)
            case 3:
                return (0,-100)
            case 4:
                return (70, -70)
            default:
                return (100,-10)
            }
        }
    }
}

struct SelectedMenu : View {
    @Binding var activate:Bool
    var menuIcon:MenuIcon
    var body: some View {
        Circle()
            .fill(menuIcon.color)
            .frame(width: activate ? 65 : 50, height: activate ? 65 : 50)
            .shadow(radius: 5)
            .overlay(Image(systemName: menuIcon.icon)
                .foregroundColor(.white)
        ).animation(.spring())
            .onTapGesture {
            self.activate.toggle()
        }
        .offset(x: 0, y: -10)
    }
}
