//
//  TabBar.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct TabBar: View {
    
    @Environment(TabBarRouter.self) private var tabBarRouter
    
    var body: some View {
        @Bindable var tabBarRouter = tabBarRouter
        TabView(selection: $tabBarRouter.selection) {
            CoordinatorStack(MainScreenPages.main)
                .setTabBarItem(selection: tabBarRouter.selection, item: .home)
            CoordinatorStack(CatalogCoordinatorPages.root)
                .setTabBarItem(selection: tabBarRouter.selection, item: .catalog)
            CoordinatorStack(MainCoordinatorPages.firstEnter)
                .setTabBarItem(selection: tabBarRouter.selection, item: .cart)
        }
    }
}

#Preview {
    TabBar()
}

extension View {
    func setTabBarItem(selection: Int, item: TabBarItems) -> some View {
        self
            .tabItem {
                selection == item.tag ? item.selectedImage : item.unselectedImage
                Text(item.title)
            }
            .tag(item.tag)
    }
}

enum TabBarItems {
    case home
    case catalog
    case cart
    case services
    case profile

    var tag: Int {
        switch self {
        case .home:
            return 0
        case .catalog:
            return 1
        case .cart:
            return 2
        case .services:
            return 3
        case .profile:
            return 4
        }
    }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .catalog:
            return "Catalog"
        case .cart:
            return "Cart"
        case .services:
            return "Services"
        case .profile:
            return "Profile"
        }
    }

    var selectedImage: Image {
        switch self {
        case .home:
            return Image(systemName: "house.fill")
        case .catalog:
            return Image(systemName: "folder.fill")
        case .cart:
            return Image(systemName: "cart.fill")
        case .services:
            return Image(systemName: "gearshape.fill")
        case .profile:
            return Image(systemName: "folder.fill.badge.person.crop")
        }
    }

    var unselectedImage: Image {
        switch self {
        case .home:
            return Image(systemName: "house")
        case .catalog:
            return Image(systemName: "folder")
        case .cart:
            return Image(systemName: "cart")
        case .services:
            return Image(systemName: "gearshape")
        case .profile:
            return Image(systemName: "folder.badge.person.crop")
        }
    }
}
