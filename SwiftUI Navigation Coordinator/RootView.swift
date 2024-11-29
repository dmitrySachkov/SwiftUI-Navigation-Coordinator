//
//  RootView.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

enum AppState {
    case firstEnter
    case login
    case mainTab
    case onboarding
}

private struct OnCompleteFirstEnterKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

private struct OnCompleteLogInKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

private struct TabBarCoordinatorKey: EnvironmentKey {
    static let defaultValue: Coordinator<MainTabBarPages>? = nil
}

extension EnvironmentValues {
    var onCompleteFirstEnter: () -> Void {
        get { self[OnCompleteFirstEnterKey.self] }
        set { self[OnCompleteFirstEnterKey.self] = newValue }
    }
    
    var onCompleteLogIn: () -> Void {
        get { self[OnCompleteLogInKey.self] }
        set { self[OnCompleteLogInKey.self] = newValue }
    }
    
    var tabBarCoordinator: Coordinator<MainTabBarPages>? {
        get { self[TabBarCoordinatorKey.self] }
        set { self[TabBarCoordinatorKey.self] = newValue }
    }
}

@Observable
final class TabBarRouter {
    var selection = 0
    var pathToView = 0
}

struct RootView: View {
    
    @State private var appState: AppState = .firstEnter
    @State private var tabBarRouter = TabBarRouter()
    
    var body: some View {
        Group {
            switch appState {
            case .firstEnter:
                CoordinatorStack(MainCoordinatorPages.firstEnter)
                    .environment(\.onCompleteFirstEnter, {
                        appState = .mainTab
                    })
                    .environment(tabBarRouter)
            case .login:
                CoordinatorStack(MainCoordinatorPages.login)
                    .environment(\.onCompleteLogIn, {
                        appState = .mainTab
                    })
                    .environment(tabBarRouter)
            case .mainTab:
                TabBar().environment(tabBarRouter)
            case .onboarding:
                CoordinatorStack(MainCoordinatorPages.firstEnter)
                    .environment(tabBarRouter)
            }
        }
    }
    
    func fetchAppStateFromBackend() {
        Task {
            do {
                let fetchedState = try await getAppState()
                DispatchQueue.main.async {
                    appState = fetchedState
                }
            } catch {
                DispatchQueue.main.async {
                    appState = .login
                }
            }
        }
    }
    
    func getAppState() async throws -> AppState {
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let backendState = "firstEnter"
        switch backendState {
        case "firstEnter": return .firstEnter
        case "login": return .login
        case "mainTab": return .mainTab
        case "onboarding": return .onboarding
        default: return .login
        }
    }
}

#Preview {
    RootView()
}
