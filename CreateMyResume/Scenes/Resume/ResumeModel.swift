//
//  ResumeModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ResumeModel: Codable {
    let resumeId: String
    let title: String
    let about: AboutContentModel
    let contact: ContactContentModel
    let careerObjective: CareerObjectiveContentModel
    let workSummary: [WorkContentModel]
    let skills: [SkillContentModel]
    let educationDetails: [EducationContentModel]
    let projectDetails: [ProjectDetailsContentModel]
    
    init() {
        self.resumeId = ""
        self.title = ""
        self.about = AboutContentModel()
        self.contact = ContactContentModel()
        self.careerObjective = CareerObjectiveContentModel()
        self.workSummary = [WorkContentModel]()
        self.skills = [SkillContentModel]()
        self.educationDetails = [EducationContentModel]()
        self.projectDetails = [ProjectDetailsContentModel]()
    }
}

class AboutContentModel: Codable {
    var firstName: String
    var lastName: String
    var picture: String
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.picture = ""
    }
}

class ContactContentModel: Codable {
    let mobile: String
    let email: String
    let address: String
    
    init() {
        self.mobile = ""
        self.email = ""
        self.address = ""
    }
    
}

class CareerObjectiveContentModel: Codable {
    let objective: String
    
    init() {
        self.objective = ""
    }
}

class WorkContentModel: Codable {
    let totalExperience: String
    let workSummary: String
    let companyName: String
    let duration: String
    
    init() {
        self.totalExperience = ""
        self.workSummary = ""
        self.companyName = ""
        self.duration = ""
    }
    
}

class SkillContentModel: Codable {
    let skill: String
    
    init() {
        self.skill = ""
    }
    
}

class EducationContentModel: Codable {
    let classDetails: String
    let year: Int
    let percentage: Double
    
    init() {
        self.classDetails = ""
        self.year = 0
        self.percentage = 0
    }
    
}

class ProjectDetailsContentModel: Codable {
    let projectName: String
    let teamSize: Int
    let summary: String
    let technologyUsed: String
    let role: String
    
    init() {
        self.projectName = ""
        self.teamSize = 0
        self.summary = ""
        self.technologyUsed = ""
        self.role = ""
    }
}

extension ResumeModel {
    static func readResumes(for email: String? = nil) -> [ResumeModel]? {
        //array of resume model [resume model]
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "resumesKey") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                //JSONDecoder is code for decoding provided by swift

                // Decode User
                let resumes = try decoder.decode([ResumeModel].self, from: data)
                guard let email = email else {
                    // To return all resumes
                    return resumes
                }
                
                // To return filtered resumes as per email
                let filteredResumes = resumes.filter {
                    $0.contact.email == email
                }
                return filteredResumes

            } catch {
                debugPrint("Unable to Decode ResumeModel (\(error))")
            }
        }
        
        return nil
    }
    
    func writeResume() {
        var resumes = ResumeModel.readResumes() ?? [ResumeModel]()
        resumes.append(self)

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Resumes
            let data = try encoder.encode(resumes)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "resumesKey")

        } catch {
            debugPrint("Unable to Encode Array of ResumeModel (\(error))")
        }
    }
    
    //Note: This function is only call when we need to update ResumeModel with new property
    /*static func updateAllResumes() {
        var resumeList = [ResumeModel]()
        if let resumes = ResumeModel.readResumes() {
            for resume in resumes {
                var resumeObj = resume
                resumeObj.resumeId = UUID().uuidString
                resumeList.append(resumeObj)
            }
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Resumes
                let data = try encoder.encode(resumeList)
                
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "resumesKey")
                
            } catch {
                debugPrint("Unable to Encode Array of ResumeModel (\(error))")
            }
        }
    } */
}
