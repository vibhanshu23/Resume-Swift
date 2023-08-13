//
//  Router.swift
//  Resume
//
//  Created by Vibhanshu Jain on 8/11/23.
//

import Foundation

struct Router {
    static func loadResume() throws -> Resume {

        guard let jsonData = fetchJSONFromNetwork() else {
            throw ResumeError.invalidData
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            return try decoder.decode(Resume.self, from: jsonData)
        } catch {
            throw ResumeError.decodingError(error)
        }

    }
    static func fetchJSONFromNetwork() -> Data? {
        let resumeJSONFilename = "resume"
        guard let resumeJSONFileURL = Bundle.main.url(forResource: resumeJSONFilename, withExtension: "json") else {
            fatalError("Failed to locate resume.json in app bundle")
        }
        if let jsonData = try? Data(contentsOf: resumeJSONFileURL) {
            return jsonData
        }
        else {return nil}
    }
}

enum ResumeError: Error {
    case invalidData
    case networkError
    case decodingError(Error)
}
