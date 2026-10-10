import Foundation

func Decode(data: Data) throws -> GithubUser {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
        return try decoder.decode(GithubUser.self, from: data)
    } catch {
        throw ErrorTypes.invalidData
    }
}
