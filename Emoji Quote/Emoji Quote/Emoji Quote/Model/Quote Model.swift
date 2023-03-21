
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let quoteModel = try? newJSONDecoder().decode(QuoteModel.self, from: jsonData)

import Foundation

// MARK: - QuoteModel
struct QuoteModel: Codable {
    let _id, content, author: String
    let tags: [String]
    let authorSlug: String
    let length: Int
    let dateAdded, dateModified: String

    enum CodingKeys: String, CodingKey {
        case _id
        case content, author, tags, authorSlug, length, dateAdded, dateModified
    }
    
    static func defaultQuote(content: String = "") -> QuoteModel {
        return QuoteModel(
            _id: "J-47k8g-i",
            content: content,
            author: "",
            tags: ["friendship", "love"],
            authorSlug: "joseph-campbell",
           length: 34,
           dateAdded: "2019-03-17",
           dateModified: "2019-03-17")
        
    }
}
