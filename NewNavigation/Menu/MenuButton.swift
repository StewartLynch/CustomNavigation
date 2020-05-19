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
    var index: Int
    var body: some View {
        Circle()
            .fill(menuItem.color)
            .frame(width: 50, height: 50)
        .shadow(radius: 5)
            .overlay(Image(systemName:menuItem.icon)
                .foregroundColor(.white)
        ).animation(.spring())
            .onTapGesture {
                self.updateSelected()
                self.isActivated.toggle()
        }.offset(x: isActivated ? 0 : calcOffset().0, y:  isActivated ? -10 : calcOffset().1)
    }
    
    func updateSelected() {
        for i in 0..<menuVM.menus.count {
            menuVM.menus[i].selected = false
        }
        menuVM.menus[self.index].selected = true
    }
    

    
    func calcOffset() -> (CGFloat, CGFloat) {
        switch self.menuVM.menus.count {
        case 1:
            return (0, -80)
        case 2:
            switch index {
            case 0:
                return (-60, -80)
            default:
                return (60, -80)
            }
        case 3:
            switch index {
            case 0:
                return (-80,-50)
            case 1:
                return (0, -100)
            default:
                return (80, -50)
            }
        case 4:
            switch index {
            case 0:
                return (-90,-20)
            case 1:
                return (-50,-90)
            case 2:
                return (50,-90)
            default:
                return (90,-20)
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
            .frame(width: isActivated ? 65 : 50, height: isActivated ? 65 : 50)
            .shadow(radius: 5)
            .overlay(Image(systemName: menuItem.icon)
                .foregroundColor(.white)
        ).animation(.spring())
            .onTapGesture {
            self.isActivated.toggle()
        }
        .offset(x: 0, y: isActivated ? -10 : -20)
    }
}
