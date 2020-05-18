//
//  HomeView.swift
//  NewNavigation
//
//  Created by Stewart Lynch on 2020-05-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingDetailView = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }
                Text("This is the Home Screen!")
                .navigationBarTitle("Circle Menus")
                    .navigationBarItems(trailing: Button(action: {
                        self.isShowingDetailView = true
                    }) {
                        Text("Push")
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
