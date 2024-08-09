//
//  Login:Signup.swift
//  Paw Swipe
//
//  Created by Rishaan Jain on 6/19/24.
//

import SwiftUI
import PhotosUI

struct LoginScreen: View {
    @State private var avatarImage: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    var body: some View {
        VStack{
            Image("Logo")
                .resizable()
                .frame(width: 318, height: 140)
                .padding(.top, 25)
            Spacer()
            ZStack{
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(Color(hex:     "#f2e4d0"))
                    .frame(width: 375, height: 505)
                
                VStack(spacing: 20){
                    Text("Sign up")
                        .fontWeight(.heavy)
                        .font(.system(size: 44))
                        .foregroundColor(.black)
                    
                    TextField("Name", text: .constant(""))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 50)
                    SecureField("Password", text: .constant(""))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 50)
                    PhotosPicker(selection: $photosPickerItem, matching: .images){
                        Image(uiImage: (avatarImage ?? UIImage(systemName: "pencil.circle"))!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .clipShape(.circle)
                        
                    }
                    Button("Submit"){}
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        
                }
                
                .padding()
                
                
                
                
                
            }
            
            
            
            Spacer()
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    LoginScreen()
}
