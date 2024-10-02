//
//  OnboardingView.swift
//  PokedexSwiftUI
//
//  Created by João Vitor Costa Ferreira on 01/10/24.
//

import SwiftUI

struct OnboardingView:  View {
    
        var body: some View {
            VStack {
                trainersImages
                Spacer().frame(height: 45)
                titleAndDescription
                Spacer().frame(height: 24)
                onboardingProgressView
                Spacer().frame(height: 24)
                continuebutton
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        
        var trainersImages: some View {
            ZStack {
                Image("trainer01")
                    .offset(x: -50)
                
                Image("trainer02")
                    .offset(x: 50)
            }
        }
        
        var titleAndDescription: some View {
            VStack(spacing: 16) {
                Text("Todos os Pokémons em um só lugar")
                    .font(Font.custom("Poppins-Medium.ttf", size: 26))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Primary"))
                
                Text("Acesse uma vasta lista de Pokémons de todas as gerações já feitas pela Nintendo")
                    .font(Font.custom("Poppins-Medium.ttf", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Secondary"))
            }
        }
        
        var onboardingProgressView: some View {
            HStack {
                Rectangle()
                    .frame(width: 28, height: 8)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(Color(.lightGray))
            }
        }
        
        var continuebutton: some View {
            Button(action: {
                
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
                    .overlay {
                        Text("Continuar")
                            .font(Font.custom("Poppins-Bold.ttf", size: 18))
                            .foregroundStyle(Color(.white))
                            
                    }
            })
        }
    }


#Preview {
    OnboardingView()
}
