//
//  MainView.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 23.11.2024.
//

import SwiftUI

struct MainView: View {
    
    @Environment(Coordinator<MainScreenPages>.self) private var coordinator
    @Environment(TabBarRouter.self) private var tabBarRouter
    
    var body: some View {
        Button("Go forward") {
            coordinator.push(.last)
        }
        .onAppear {
            switch tabBarRouter.pathToView {
            case 1:
                coordinator.push(.last)
            default:
                break
            }
            tabBarRouter.pathToView = 0
        }
    }
}

#Preview {
    MainView()
}
