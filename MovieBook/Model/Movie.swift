import Foundation

// MARK: - Welcome
public struct Movie: Codable {
    let search: [Search]?
    let totalResults, response: String?

   private enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
public struct Search: Codable {
    let title, year, imdbID: String?
    let type: TypeEnum?
    let poster: String?

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case game = "game"
    case movie = "movie"
    case series = "series"
}

