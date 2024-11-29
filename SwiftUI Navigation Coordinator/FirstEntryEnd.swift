//
//  FirstEntryEnd.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct FirstEntryEnd: View {
    
    @Environment(Coordinator<MainCoordinatorPages>.self) private var mainCoordinator
    @Environment(\.onCompleteFirstEnter) private var onCompleteFirstEnter
    
    var body: some View {
        VStack {
            Text("End flow")
            Spacer()
            Button {
                onCompleteFirstEnter()
            } label: {
                Text("End flow")
            }

        }
        .frame(height: 150)
    }
}
