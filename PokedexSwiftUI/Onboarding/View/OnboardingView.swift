//
//  OnboardingView.swift
//  PokedexSwiftUI
//
//  Created by João Vitor Costa Ferreira on 01/10/24.
//

import SwiftUI

struct OnboardingView:  View {
    @ObservedObject var viewModel: OnboardViewModel
    
        var body: some View {
            TabView(selection: $viewModel.currentStep) {
                ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                    VStack {
                        trainersImages(image: viewModel.onboardingSteps[index].image)
                        Spacer().frame(height: 45)
                        titleAndDescription(
                            title: viewModel.onboardingSteps[index].title,
                            description: viewModel.onboardingSteps[index].description
                        )
                       
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding()

                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.5), value: viewModel.currentStep)
            
            Spacer().frame(height: 24)
            onboardingProgressView
            Spacer().frame(height: 24)
            continuebutton(buttonText: viewModel.onboardingSteps[viewModel.currentStep].buttonText)
        }
        
    func trainersImages(image: String) -> some View {
        Image(image)
    }
        
    func titleAndDescription(title: String, description: String) -> some View {
            VStack(spacing: 16) {
                Text(title)
                    .font(Font.custom("Poppins-Medium.ttf", size: 26))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Primary"))
                
                Text(description)
                    .font(Font.custom("Poppins-Medium.ttf", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Secondary"))
            }
        }
        
        var onboardingProgressView: some View {
            HStack {
                ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                    Rectangle()
                        .frame(width: viewModel.currentStep == index ? 28: 8, height: 8)
                        .clipShape(.capsule)
                        .foregroundStyle(viewModel.currentStep == index ? Color("DarkBlue"): Color(.lightGray))
                        .animation(.easeInOut(duration: 0.3), value: viewModel.currentStep)
                }
            }
        }
        
        func continuebutton(buttonText: String) -> some View {
            Button(action: {
                if viewModel.currentStep < viewModel.onboardingSteps.count - 1 {
                    viewModel.currentStep += 1
                }
                viewModel.currentStep = 1
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
                    .overlay {
                        Text(buttonText)
                            .font(Font.custom("Poppins-Bold.ttf", size: 18))
                            .foregroundStyle(Color(.white))
                            
                    }
            })
            .padding()
        }
    }


#Preview {
    OnboardingView(viewModel: OnboardViewModel())
}
