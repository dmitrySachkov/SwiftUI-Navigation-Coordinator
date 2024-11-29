//
//  CoordinatorStack.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct CoordinatorStack<CoordinatorPage: Coordinatable>: View {
    
    let root: CoordinatorPage
    
    init(_ root: CoordinatorPage) {
        self.root = root
    }
    
    @State private var coordinator = Coordinator<CoordinatorPage>()
    @Environment(TabBarRouter.self) private var tabBarRouter
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            root
                .navigationDestination(for: CoordinatorPage.self) { $0 }
                .sheet(item: $coordinator.sheet) { $0 }
                .fullScreenCover(item: $coordinator.fullScreenCover) { $0 }
        }
        .environment(coordinator)
        .environment(tabBarRouter)
    }
}

