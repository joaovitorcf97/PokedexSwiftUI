//
//  OnboardViewModel.swift
//  PokedexSwiftUI
//
//  Created by João Vitor Costa Ferreira on 05/10/24.
//

import Foundation

class OnboardViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var onboardingSteps: [OnboardingStep] = [
        OnboardingStep(
            image: "trainers04",
            title: "Todos os Pokémons em um só lugar",
            description: "Acesse uma vasta lista de Pokémons de todas as gerações já feitas pela Nintendo.",
            buttonText: "Continuar"
        ),
        OnboardingStep(
            image: "trainer02",
            title: "Mantenha sua Pokédex atualizada",
            description: "Cadastre-se e mantenha seu perfil, pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet.",
            buttonText: "Vamos começar"
        ),
    ]
}
