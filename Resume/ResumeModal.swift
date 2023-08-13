//
//  ResumeModal.swift
//  Resume
//
//  Created by Vibhanshu Jain on 8/11/23.
//

import Foundation

struct Resume: Codable {

    var selectedTemplate: Int
    var headings: ResumeHeadings
    var basics: Basics
    var work: [WorkExperience]
    var education: [Education]
    var skills: [Skills]
    var projects: [Project]
    var awards: [Award]
    var sections: [String]

    struct ResumeHeadings: Codable{
        var work: String
        var education: String
        var skills: String
        var projects: String
        var awards: String
    }

    struct Basics: Codable {
        var name: String
        var email: String?
        var phone: String?
        var location: Location?
        var website: String?

        struct Location: Codable {
            var address: String
        }
    }

    struct WorkExperience: Identifiable, Codable {
        var id = UUID()

        var company: String
        var position: String
        var website: String?
        var startDate: String
        var endDate: String?
        var highlights: [String]
        var location: String
        private enum CodingKeys: String, CodingKey {
            case company
            case position
            case website
            case startDate
            case endDate
            case highlights
            case location
        }
        
    }

    struct Education: Identifiable, Codable {
        var id = UUID()
        var institution: String
        var area: String
        var studyType: String
        var startDate: String
        var endDate: String?
        var gpa: String?
        var location: String
        private enum CodingKeys: String, CodingKey {
            case institution
            case area
            case studyType
            case startDate
            case endDate
            case gpa
            case location
        }
    }

    struct Skills: Identifiable, Codable {
        var id = UUID()
        var name: String
        var keywords: [String]
        private enum CodingKeys: String, CodingKey {
            case name
            case keywords
        }
    }

    struct Project : Identifiable, Codable {
        var id = UUID()
        var name: String
        var description: String
        var url: String
        var keywords: [String]
        private enum CodingKeys: String, CodingKey {
            case name
            case description
            case url
            case keywords
        }
    }

    struct Award : Identifiable, Codable {
        var id = UUID()
        var title: String
        var date: String?
        var awarder: String?
        var summary: String?
        private enum CodingKeys: String, CodingKey {
            case title
            case date
            case awarder
            case summary
        }
    }

}
