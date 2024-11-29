//
//  LoginSecond.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct LoginSecond: View {
    
    @Environment(Coordinator<CatalogCoordinatorPages>.self) private var mainCoordinator
    
    var body: some View {
        VStack {
            Text("Catalog 3")
            Spacer()
            Button {
                mainCoordinator.push(.fourth)
            } label: {
                Text("Go next")
            }

        }
        .frame(height: 150)
    }
}

#Preview {
    LoginSecond()
}
