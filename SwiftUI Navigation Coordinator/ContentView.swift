//
//  ContentView.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstEnter") private var isFirstEnter: Bool = false
        @AppStorage("isLogin") private var isLogin: Bool = false
    
    var body: some View {
        if isFirstEnter {
            
        } else {
            CoordinatorStack(MainCoordinatorPages.firstEnter)
        }
    }
}

#Preview {
    ContentView()
}
