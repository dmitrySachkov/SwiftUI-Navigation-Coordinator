//
//  Coordinator.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI
import Observation

@Observable
class Coordinator<CoordinatorPage: Coordinatable> {
    
    var path = NavigationPath()
    var sheet: CoordinatorPage?
    var fullScreenCover: CoordinatorPage?
    
    enum PushType {
        case link
        case sheet
        case fullScreenCover
    }
    
    enum PopType {
        case link(_ last: Int)
        case sheet
        case fullScreenCover
    }
    
    func push(_ page: CoordinatorPage, type: PushType = .link) {
        switch type {
        case .link:
            path.append(page)
        case .sheet:
            sheet = page
        case .fullScreenCover:
            fullScreenCover = page
        }
    }
    
    func pop(type: PopType = .link(1)) {
        switch type {
        case .link(let last):
            path.removeLast(last)
        case .sheet:
            sheet = nil
        case .fullScreenCover:
            fullScreenCover = nil
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func changeTab(_ tabNumber: Int) {
        
    }
}


