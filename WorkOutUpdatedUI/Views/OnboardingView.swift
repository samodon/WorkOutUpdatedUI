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
                .modifier(TextFieldStyle())

                HStack {
                    TextField("First Name", text: .constant(""))
                }
                .modifier(TextFieldStyle())
                HStack {
                    TextField("Last Name", text: .constant(""))
                }
                .modifier(TextFieldStyle())

                HStack {
                    SecureField("password", text: .constant(""))
                }
                .modifier(TextFieldStyle())

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
                .modifier(TextFieldStyle())

                HStack {
                    TextField("Gender", text: .constant(""))
                    Spacer()
                    Picker("Picker", selection: .constant(0)) {
                        Text("Male").tag(1)
                        Text("Female").tag(2)
                        Text("Prefer not to say").tag(3)
                    }
                    .pickerStyle(.menu)
                    .frame(
                        height: 20
                    )
                }
                .modifier(TextFieldStyle())

                Button(role: .none) {} label: {
                    HStack {
                        TextField("Add a profile picture(optional)", text: .constant(""))
                        Spacer()
                        Image(systemName: "person.crop.circle")
                    }
                    .modifier(TextFieldStyle())
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

struct TextFieldStyle: ViewModifier {
    init(){}
    func body(content: Content) -> some View {
        content
            .padding()
            .background(alignment: .center) {
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .fill(Color(hue: 0.532, saturation: 0.824, brightness: 0.737, opacity: 1))
                    .shadow(color: Color(uiColor: .black), radius: 0, x: 3, y: 5)
            }
            .background(alignment: .center) {
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .stroke(Color(uiColor: .black), lineWidth: 4)
            }
            .padding()
    }
}


#Preview{
    OnboardingView()
}

