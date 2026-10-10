import Foundation

func getUser() async throws -> GithubUser {

    let endpoint = "https://api.github.com/users/crx-21"

    guard let url = URL(string: endpoint) else { throw ErrorTypes.invalidUrl }

    var request = URLRequest(url: url)
    request.setValue("MyGithubApp", forHTTPHeaderField: "User-Agent")

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let response = response as? HTTPURLResponse,
        response.statusCode == 200
    else {
        throw ErrorTypes.invalidResponse
    }

    return try Decode(data: data)

}
