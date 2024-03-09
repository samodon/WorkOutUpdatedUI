//
//  SwiftUIView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 2/25/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView{
            Vstack{
                Text("Profile")
            }
            
        }
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
        .navigationTitle("Settings")
        
    }
}

#Preview {
    SwiftUIView()
}
