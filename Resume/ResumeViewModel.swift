//
//  ResumeViewModel.swift
//  Resume
//
//  Created by Vibhanshu Jain on 8/13/23.
//

import Foundation

class ResumeViewModel: ObservableObject {

    @Published var resume: Resume?
    @Published var state: ResumeState = .loading

    init(resume: Resume? = nil) {

        if let resume = resume {
            self.resume = resume
        }
        else{
            loadResume()
        }
    }
    
    func loadResume() {
        self.state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            do{
                let resumeResponse = try Router.loadResume()
                DispatchQueue.main.async {
                    self.state = .loaded(resumeResponse)
                }
            }
            catch{
                DispatchQueue.main.async {
                    self.state = .failed(error)
                }
            }
        }


    }

}

enum ResumeState {
    case loading
    case loaded(Resume)
    case failed(Error)
}

