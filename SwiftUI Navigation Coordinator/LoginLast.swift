//
//  LoginLast.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct LoginLast: View {
    
    @Environment(Coordinator<CatalogCoordinatorPages>.self) private var mainCoordinator
    @Environment(TabBarRouter.self) private var tabBarRouter
    
    var body: some View {
        VStack {
            Text("Login flow 3")
            Spacer()
            Button {
                mainCoordinator.popToRoot()
            } label: {
                Text("Finish")
            }

            Spacer()
            
            Button {
                tabBarRouter.selection = 0
                tabBarRouter.pathToView = 1
            } label: {
                Text("Go to Home second")
            }
        }
        .frame(height: 150)
    }
}

#Preview {
    LoginLast()
}
