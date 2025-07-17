import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var goHome = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login Screen")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .fontWeight(.bold)

                Image("Luffy")
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)

                TextField("User", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                Spacer()
                    .frame(maxHeight: .infinity, alignment: .bottom)

                Button(action: {
                    if !username.isEmpty && !password.isEmpty {
                        goHome = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width: 315)
                        .background(Color.red)
                        .cornerRadius(10)
                }

                NavigationLink(destination: HomeView(username: username), isActive: $goHome) {
                    EmptyView()
                }
                .hidden()

                Spacer()

                HStack {
                    Text("Don't you have an account?")
                        .font(.footnote)

                    Text("Sign up here!")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .onTapGesture {
                            print("Registration requested")
                        }
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Empty fields!"),
                    message: Text("Please, fill all the requested information."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
