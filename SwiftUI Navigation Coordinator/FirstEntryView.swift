//
//  FirstEntryView.swift
//  SwiftUI Navigation Coordinator
//
//  Created by Dmitry Sachkov on 18.11.2024.
//

import SwiftUI

struct FirstEntryView: View {
    
    @Environment(Coordinator<FirstEntryPages>.self) private var mainCoordinator
    
    var body: some View {
        VStack {
            Text("First entry flow")
            
            Spacer()
            
            Button {
                mainCoordinator.push(.stepTwo)
            } label: {
                Text("Go next")
            }

        }
        .frame(height: 150)
    }
}

#Preview {
    FirstEntryView()
}
