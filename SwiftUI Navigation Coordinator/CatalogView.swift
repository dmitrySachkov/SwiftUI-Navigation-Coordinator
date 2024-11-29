//
//  CatalogView.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct CatalogView: View {
    
    @Environment(Coordinator<CatalogCoordinatorPages>.self) private var mainCoordinator
    @Environment(TabBarRouter.self) private var tabBarRouter
    
    var body: some View {
        VStack {
            Text("Catalog")
            
            Spacer()
            
            Button {
                mainCoordinator.push(.second)
            } label: {
                Text("Go next")
            }
            
            Spacer()
            
            Button {
                tabBarRouter.selection = 0
            } label: {
                Text("go to first tab")
            }

        }
        .frame(height: 150)
        .onAppear {
            switch tabBarRouter.pathToView {
            case 1:
                mainCoordinator.push(.second)
            case 2:
                mainCoordinator.push(.theerd)
            case 3:
                mainCoordinator.push(.fourth)
            default:
                break
            }
            tabBarRouter.pathToView = 0
        }
    }
}

#Preview {
    CatalogView()
}
