//
//  SignInView.swift
//  RiveAnimated
//
//  Created by HardiB.Salih on 7/14/23.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")

    
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var showModal: Bool
    
    func logIn() {
        isLoading.toggle()
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading.toggle()
                confetti.triggerInput("Trigger explosion")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.spring()) {
                    showModal.toggle()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading.toggle()
            }
        }
    }
    
    
    var body: some View {
        VStack (spacing: 24){
            Text("Sign in")
                .customFont(.largeTitle)
            
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                    .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("Email", text: $email)
                    .customTextField(image: Image("Icon Email"))
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Password")
                        .customFont(.subheadline)
                    .foregroundColor(.secondary)
                    Spacer()
                    Text("Forgot Password?")
                        .customFont(.subheadline)
                    .foregroundColor(.secondary)
                }
                SecureField("Password", text: $password)
                    .customTextField(image: Image("Icon Lock"))
            }
            
            Button{
                logIn()
                
            } label:  {
                Label("Sign In", systemImage: "arrow.right")
                    .customFont(.headline)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "F77D8E"))
                .foregroundColor(.white)
                .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                .cornerRadius(8)
            .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
            }
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2).opacity(0.3)
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign up with Email, Apple, Google")
                   .customFont(.subheadline)
                   .foregroundColor(.secondary)
            
            HStack {
                  Image("Logo Email")
                  Spacer()
                  Image("Logo Apple")
                  Spacer()
                  Image("Logo Google")
              }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .padding()
        .overlay {
            if isLoading {
                check.view()
                    .frame(width: 100, height: 100)
                    .allowsHitTesting(false)
            }
            confetti.view()
                .scaleEffect(3)
                .allowsHitTesting(false)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(showModal: .constant(true))
    }
}
