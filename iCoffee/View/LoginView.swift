//
//  LoginView.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/16.
//

import SwiftUI

struct LoginView: View {
    
    @State var showingSignUp = false
    
    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    
    var body: some View {
        
        VStack {
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding([.top, .bottom], 20)
            
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    
                    TextField("Enter your Email", text: $email)
                    
                    Divider()
                    
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    
                    SecureField("Enter your password", text: $password)
                    
                    Divider()
                    
                    if showingSignUp {
                        Text("Repeat Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        
                        
                        TextField("Repeat Password", text: $repeatPassword)
                        
                        Divider()
                    }
                }
                .padding(.bottom, 15)
                .animation(.easeOut(duration: 0.1))
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("reset password")
                    } label: {
                        Text("Forgot Password")
                            .foregroundColor(.gray.opacity(0.5))
                    }
                }
            }
            .padding(.horizontal,6)
            
            Button {
                self.showingSignUp ? self.signUpUser() : self.loginUser()
            } label: {
                Text(showingSignUp ? "Sign UP" : "Sign In")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            }
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 45)
            
            SignUpView(showingSignup: $showingSignUp)

        }
    }
    
    
    private func loginUser(){
        
    }
    
    private func signUpUser() {
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct SignUpView: View {
    
    @Binding var showingSignup: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                Text("Don't have an Account?")
                    .foregroundColor(.gray.opacity(0.5))
                
                Button {
                    self.showingSignup.toggle()
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 25)
        }
    }
}
