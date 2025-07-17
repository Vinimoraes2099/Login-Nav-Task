import SwiftUI

struct HomeView: View {
    var username: String
    @State private var animate = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome!")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .fontWeight(.bold)
                .scaleEffect(animate ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)
                .onAppear { animate = true }

            Image("Luffy2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: animate)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                .foregroundColor(.red)
                .padding(.bottom, 20)

            Text("Hello, \(username)!")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color.purple)
                .bold()
                .padding()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.purple, .blue, .pink],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .hueRotation(.degrees(animate ? 100 : 0))
                .animation(
                    .linear(duration: 3).repeatForever(autoreverses: false),
                    value: animate
                )

            Text("Before going to the Grand Line, we must do some tasks. Let's check it out on the next page!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .rotation3DEffect(
                    .degrees(animate ? 30 : 0),
                    axis: (x: 1.0, y: 1.0, z: 0.0)
                )
                .animation(
                    .easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                    value: animate
                )

            Spacer()

            NavigationLink(destination: TaskListView(username: username)) {
                Text("Go to the Grand Line!")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.purple, .indigo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .purple.opacity(0.4), radius: 5, y: 5)
                    .padding(.horizontal)
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding()
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView(username: "Mugiwara")
}
