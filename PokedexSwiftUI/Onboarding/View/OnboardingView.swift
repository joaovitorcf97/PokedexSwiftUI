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
        NavigationView {
            ZStack {
                if viewModel.showSplash {
                    SplashView()
                } else {
                    VStack {
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
                    .background(Color("AppBackground"))
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.viewModel.showSplash = false
                    }
                }
            }
        }
    }
    
    
    func trainersImages(image: String) -> some View {
        Image(image)
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(FontMaker.makeFont(.poppinsBold, 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("AppPrimary"))
            
            Text(description)
                .font(FontMaker.makeFont(.poppinsRegular, 16))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("AppSecondary"))
        }
    }
    
    var onboardingProgressView: some View {
        HStack {
            ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                Rectangle()
                    .frame(width: viewModel.currentStep == index ? 28: 8, height: 8)
                    .clipShape(.capsule)
                    .foregroundStyle(viewModel.currentStep == index ? Color("AppDarkBlue"): Color(.gray))
                    .animation(.easeInOut(duration: 0.3), value: viewModel.currentStep)
            }
        }
    }
    
    @ViewBuilder
    func continuebutton(buttonText: String) -> some View {
        if viewModel.currentStep == 0 {
            Button(action: {
                if viewModel.currentStep < viewModel.onboardingSteps.count - 1 {
                    viewModel.currentStep += 1
                }
                
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("AppDarkBlue"))
                    .overlay {
                        Text(buttonText)
                            .font(FontMaker.makeFont(.poppinsBold, 18))
                            .foregroundStyle(Color(.white))
                        
                    }
            })
            .padding()
        } else {
            NavigationLink {
                LoginAndSignUp()
            } label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("AppDarkBlue"))
                    .overlay {
                        Text(buttonText)
                            .font(FontMaker.makeFont(.poppinsBold, 18))
                            .foregroundStyle(Color(.white))
                        
                    }
            }
            .padding()
        }
    }
}


#Preview {
    OnboardingView(viewModel: OnboardViewModel())
}
