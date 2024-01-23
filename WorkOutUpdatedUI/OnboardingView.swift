//
//  OnboardingView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/20/23.
//

import SwiftUI

struct OnboardingView: View {
    init() {}

    var body: some View {
        NavigationStack {
            VStack {
                Text("This will be used to save your info for social challenges ")
                Spacer()
                HStack {
                    TextField("Username", text: .constant(""))
                }
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 5
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                }
                .padding()

                HStack {
                    TextField("First Name", text: .constant(""))
                }
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 5
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                }
                .padding()

                HStack {
                    TextField("Last Name", text: .constant(""))
                }
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 5
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                }
                .padding()

                HStack {
                    SecureField("password", text: .constant(""))
                }
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 5
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                }
                .padding()

                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: OnboardingView2()) { // 2. Use a NavigationLink to define the destination
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(uiColor: .black))
                    }
                
                }
                .padding()
            }
            .background(Color(hue: 0.178, saturation: 0.775, brightness: 0.871, opacity: 1).edgesIgnoringSafeArea(.all))
            .navigationTitle("Enter your info")
        }
    }
}
struct OnboardingView2: View {
    init() {}

    var body: some View {
        NavigationStack {
            Text("Once you're done tap the arrow to bein your journey!")
            Spacer()
            VStack {
                HStack {
                    TextField("Email", text: .constant(""))
                }
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 5
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                }
                .padding()

                HStack {
                    TextField("Gender", text: .constant(""))
                    Spacer()
                    Picker("Picker", selection: .constant(0)) {
                        Text("Option 1").tag(1)
                        Text("Option 2").tag(2)
                        Text("Option 3").tag(3)
                    }
                    .pickerStyle(.menu)
                    .frame(
                        height: 20
                    )
                }
                .padding()
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(
                        color: Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 5
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(Color(uiColor: .black), lineWidth: 4)
                }
                .padding()

                Button(role: .none) {} label: {
                    HStack {
                        TextField("Add a profile picture(optional)", text: .constant(""))
                        Spacer()
                        Image(systemName: "person.crop.circle")
                    }
                    .padding()
                    .background(alignment: .center) {
                        RoundedRectangle(
                            cornerRadius: 8,
                            style: .circular
                        )
                        .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                        .shadow(
                            color: Color(uiColor: .black),
                            radius: 0,
                            x: 3,
                            y: 5
                        )
                    }
                    .background(alignment: .center) {
                        RoundedRectangle(
                            cornerRadius: 8,
                            style: .circular
                        )
                        .stroke(Color(uiColor: .black), lineWidth: 4)
                    }
                    .padding()
                }
            }
            .navigationTitle("Enter some more info")
            .navigationBarBackButtonHidden()

            Spacer()
            HStack {
                Text("Begin")
                    .font(.system(.body, design: .default))

                Spacer()
                NavigationLink(destination: HomeScreenView() ){
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color(uiColor: .black))
                }
            }
            .padding()
        }
        .background(alignment: .center) {
            RoundedRectangle(
                cornerRadius: 8,
                style: .circular
            )
            .fill(Color(hue: 0.178, saturation: 0.775, brightness: 0.871, opacity: 1))
            .ignoresSafeArea(edges: [.all])
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

