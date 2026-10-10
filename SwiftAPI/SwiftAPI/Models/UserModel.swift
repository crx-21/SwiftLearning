import Foundation

struct GithubUser: Codable
{
    let login: String
    let bio: String?
    let publicRepos: Int
    let avatarUrl: String
}
