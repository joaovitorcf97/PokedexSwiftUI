//
//  LoginAndSignUp.swift
//  PokedexSwiftUI
//
//  Created by João Vitor Costa Ferreira on 05/10/24.
//

import SwiftUI

struct LoginAndSignUp: View {
    var body: some View {
        VStack {
            Image("trainers05")
            Text("Está pronto para essa aventura?")
                .font(FontMaker.makeFont(.poppinsBold, 26))
                .multilineTextAlignment(.center)
            Text("Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!")
                .font(FontMaker.makeFont(.poppinsRegular, 16))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("AppSecondary"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginAndSignUp()
}
