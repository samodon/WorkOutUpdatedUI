import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack{
                        HStack {
                            Image("Personal Trainer Headshot")
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: 75,
                                    height: 75
                                )
                                .clipShape(
                                    Circle(),
                                    style: FillStyle(
                                        eoFill: false,
                                        antialiased: true
                                    )
                                )
                            
                            VStack() {
                                Text("Jovane Samuels")
                                    .bold()
                                    .font(.system(.title3, design: .default))
                                
                                Text("tap to edit profile")
                                    .font(.system(.caption2, design: .default))
                            }
                            Spacer()
                        }
                        .padding()
                        .background(alignment: .center) {
                            RoundedRectangle(cornerRadius: 8, style: .circular)
                                .fill(Color.yellow) // Fill color
                                .shadow(color: Color(hue: 0, saturation: 0, brightness: 0, opacity: 1), radius: 0, x: 3, y: 4) // Shadow
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8, style: .circular) // Stroke (border)
                                        .stroke(Color(uiColor: .black), lineWidth: 2)
                                )
                        }
                        
                        .buttonStyle(.plain)
                        .padding()
                        
                        Divider()
                            .padding(.horizontal)
                        
                        VStack {
                            Button {
                                //todo
                            } label: {
                                HStack {
                                    Image(systemName: "gear")
                                    Text("General")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                            Button {
                                //to do
                            } label: {
                                HStack {
                                    Image(systemName: "paintbrush.fill")
                                    Text("Themes")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                            Button {
                                // to do
                            } label: {
                                HStack {
                                    Image(systemName: "lock.shield.fill")
                                        .symbolRenderingMode(.multicolor)
                                    Text("Privacy")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                            Button {
                                // to do
                            } label: {
                                HStack {
                                    Image(systemName: "speedometer")
                                    Text("Units")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                            Button {
                                // to do
                            } label: {
                                HStack {
                                    Image(systemName: "bell.fill")
                                    Text("Notifications")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                            Button {
                                // to do
                            } label: {
                                HStack {
                                    Image(systemName: "questionmark.circle.fill")
                                    Text("Support")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                            Button {
                                // to do
                            } label: {
                                HStack {
                                    Image(systemName: "info.circle.fill")
                                    Text("About")
                                        .bold()
                                        .font(.system(.title3, design: .default))
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                            
                            Divider()
                        }
                        
                        .padding()
                    }
                    .navigationTitle("Settings")
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }

    
    
    // Preview
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
    

