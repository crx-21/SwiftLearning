import SwiftUI

struct ContentView: View {
    @State private var users: GithubUser?

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: users?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(Color.blue)
                    .frame(width: 150, height: 150)
            }

            Text(users?.login ?? "Username placeholder")
                .font(.system(size: 30))
                .bold()

            Text(users?.bio ?? "Description Placeholder")
                .font(.system(size: 20))

            Spacer()

            Text("Number of Repos:\(users?.publicRepos ?? 0)")
        }
        .padding()
        .task {
            do {
                users = try await getUser()
            } catch ErrorTypes.invalidUrl {
                print("Invalid Url")
            } catch ErrorTypes.invalidResponse {
                print("Invalid Response")
            } catch ErrorTypes.invalidData {
                print("Invalid Data")
            } catch {
                print("Unexpected Error")
            }
        }
    }
}

#Preview {
    ContentView()
}
