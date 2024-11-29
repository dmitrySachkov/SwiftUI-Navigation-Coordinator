//
//  BogdanDeathView.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 29.11.2024.
//

import SwiftUI

struct BogdanDeathView: View {
    
    @Environment(Coordinator<MainScreenPages>.self) private var coordinator
    @Environment(TabBarRouter.self) private var tabBarRouter
    
    var body: some View {
        List {
            Button("Pop to root") {
                coordinator.popToRoot()
            }
            
            Spacer()
            
            Button("Go to catalog last") {
                tabBarRouter.selection = 1
                tabBarRouter.pathToView = 3
            }
        }
    }
}

#Preview {
    BogdanDeathView()
}
