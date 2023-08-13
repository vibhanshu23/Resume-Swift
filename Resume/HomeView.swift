//
//  HomeView.swift
//  Resume
//
//  Created by Vibhanshu Jain on 8/11/23.
//

import Foundation
import SwiftUI
struct HomeView: View {

    @ObservedObject var viewModel: ResumeViewModel

    init(viewModel: ResumeViewModel = ResumeViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            switch viewModel.state {

                case .loading:
                    ProgressView()

                case .loaded(let resume):
                    ResumeListView(viewModelResume: resume)

                case .failed(let error):
                    Text(error.localizedDescription)
            }

        }
    }
}

struct ResumeListView: View {

    @State var viewModelResume: Resume

    var body: some View {

            List {

                // Profile section
                Section(header: Text(viewModelResume.basics.name)) {
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 50, height: 50)

                        VStack(alignment: .leading) {
                            Text(viewModelResume.basics.name)
                                .font(.title)

                            if let email = viewModelResume.basics.email {
                                Text(email)
                            }
                            if let phone = viewModelResume.basics.phone {
                                Text(phone)
                            }
                            if let location = viewModelResume.basics.location {
                                Text(location.address)
                            }

                            if let website = viewModelResume.basics.website {
                                Link("Website", destination: URL(string: website)!)
                            }
                        }
                    }
                }

                // Experience section
                Section(header: Text(viewModelResume.headings.work)) {
                    ForEach(viewModelResume.work, id: \.id) { work in
                        VStack(alignment: .leading) {
                            Text(work.position)
                                .font(.headline)

                            Text(work.company)
                            Text(work.location)
                                .foregroundColor(.secondary)

                            HStack {
                                Text(work.startDate)
                                Text(" - ")
                                if let endDate = work.endDate {
                                    Text(endDate)
                                } else {
                                    Text("Present")
                                }
                            }
                            .foregroundColor(.secondary)

                            ForEach(work.highlights, id:\.uniqueID) { highlight in
                                Text(highlight)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

                // Education section
                Section(header: Text(viewModelResume.headings.education)) {
                    ForEach(viewModelResume.education, id: \.id) { edu in
                        VStack(alignment: .leading) {
                            Text(edu.studyType)
                                .font(.headline)

                            Text(edu.institution)
                            Text(edu.area)
                            Text(edu.location)
                                .foregroundColor(.secondary)

                            HStack {
                                Text(edu.startDate)
                                Text(" - ")
                                if let endDate = edu.endDate {
                                    Text(endDate)
                                }
                            }
                            .foregroundColor(.secondary)
                        }
                    }
                }

                // Skills section
                Section(header: Text(viewModelResume.headings.skills)) {
                    ForEach(viewModelResume.skills, id: \.id) { skill in
                        Text(skill.name)
                        ForEach(skill.keywords, id:\.uniqueID) { keyword in
                            Text(keyword)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                // Awards section
                if !viewModelResume.awards.isEmpty {
                    Section(header: Text(viewModelResume.headings.awards)) {
                        ForEach(viewModelResume.awards, id: \.id) { award in
                            VStack(alignment: .leading) {
                                Text(award.title)

                                if let date = award.date {
                                    Text(date)
                                }

                                if let summary = award.summary {
                                    Text(summary)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }

            }
            .navigationTitle(Text(viewModelResume.basics.name))
        }


}
