//
//  CoordinatorPage.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

enum MainCoordinatorPages: Coordinatable {
    var id: UUID { .init() }
    
    case root
    case login
    case firstEnter
    
    var body: some View {
        switch self {
        case .root:
            RootView()
        case .login:
            CoordinatorStack(LoginCoordinatorPages.root)
        case .firstEnter:
            CoordinatorStack(FirstEntryPages.root)
        }
    }
}

enum MainTabBarPages: Coordinatable {
    var id: UUID { .init() }
     
    case main
    case catalog
    case favorite
    case profile
    
    var body: some View {
        switch self {
        case .main:
            CoordinatorStack(MainScreenPages.main)
        case .catalog:
            CoordinatorStack(CatalogCoordinatorPages.root)
        case .favorite:
            CoordinatorStack(FavoriteScreenPages.favorite)
        case .profile:
            CoordinatorStack(ProfilePages.root)
        }
    }
    
    var selection: Int {
        switch self {
        case .main:
            return 0
        case .catalog:
            return 1
        case .favorite:
            return 2
        case .profile:
            return 3
        }
    }
}

enum MainScreenPages: Coordinatable {
    var id: UUID { .init() }
     
    case main
    case last
    
    var body: some View {
        switch self {
        case .main:
            MainView()
        case .last:
            BogdanDeathView()
        }
    }
    
    var index: Int {
        switch self {
        case .main:
            return 0
        case .last:
            return 1
        }
    }
}

enum FavoriteScreenPages: Coordinatable {
    var id: UUID { .init() }
     
    case favorite
    
    var body: some View {
        switch self {
        case .favorite:
            FavoriteView()
        }
    }
}

enum ProfilePages: Coordinatable {
    var id: UUID { .init() }
    
    case root
    case profile
    case registration
    case documentStorage
    
    var body: some View {
        switch self {
        case .root:
            ProfileRootView()
        case .profile:
            ProfileView()
        case .registration:
            LogIn()
        case .documentStorage:
            CartView()
        }
    }
}

enum FirstEntryPages: Coordinatable {
    var id: UUID { .init() }
    
    case root
    case stepTwo
    
    var body: some View {
        switch self {
        case .root:
            FirstEntryView()
        case .stepTwo:
            FirstEntryEnd()
        }
    }
}

enum LoginCoordinatorPages: Coordinatable {
    var id: UUID { .init() }
    
    case root
    case second
    case theerd
    case forgotPassword
    
    var body: some View {
        switch self {
        case .root:
            LogIn()
        case .second:
            LoginSecond()
        case .theerd:
            LoginLast()
        case .forgotPassword:
            EmptyView()
        }
    }
}

enum CatalogCoordinatorPages: Coordinatable {
    var id: UUID { .init() }
    
    case root
    case second
    case theerd
    case fourth
    
    var body: some View {
        switch self {
        case .root:
            CatalogView()
        case .second:
            LogIn()
        case .theerd:
            LoginSecond()
        case .fourth:
            LoginLast()
        }
    }
    
    var index: Int {
        switch self {
        case .root:
            return 0
        case .second:
            return 1
        case .theerd:
            return 2
        case .fourth:
            return 3
        }
    }
}
