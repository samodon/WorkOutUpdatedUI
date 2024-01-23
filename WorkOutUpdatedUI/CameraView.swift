//
//  CameraView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/26/23.
//

import SwiftUI

struct CameraView: View {
    init() {}

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Text("4")
                        //.font(.system(.largeTitle, design: .serif))
                        .font(.system(size: 170, design: .serif))
                        .fontWeight(.black)
                        .padding()
                        .foregroundColor(.white)
                        
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(uiColor: .systemGray))
                    .frame(
                        minWidth: 350,
                        maxWidth: 450,
                        minHeight: 650,
                        maxHeight: 700
                    )
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 5,
                        y: 2
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                    .frame(
                        width: 350,
                        height: 650
                    )
                }
            }
            .navigationTitle("Push Up Challenge")
        }
    }
}

#Preview {
    CameraView()
}
