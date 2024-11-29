//
//  LogIn.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct LogIn: View {
    
    @Environment(Coordinator<CatalogCoordinatorPages>.self) private var mainCoordinator
    
    var body: some View {
        VStack {
            Text("Catalog 2")
            
            Spacer()
            
            Button {
                mainCoordinator.push(.theerd)
            } label: {
                Text("Go next")
            }

        }
        .frame(height: 150)
    }
}

#Preview {
    LogIn()
}
