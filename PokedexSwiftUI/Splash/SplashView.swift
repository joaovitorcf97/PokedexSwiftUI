//
//  SplashView.swift
//  PokedexSwiftUI
//
//  Created by João Vitor Costa Ferreira on 05/10/24.
//

import SwiftUI

struct SplashView: View {
    @State private var scale = 0.5
    @State private var opacity = 0.9
    
    var body: some View {
        ZStack {
            Color("AppBackgroundBlue")
            Image("pokedex_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.8)) {
                        self.scale = 1.0
                        self.opacity = 1.0
                    }
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
