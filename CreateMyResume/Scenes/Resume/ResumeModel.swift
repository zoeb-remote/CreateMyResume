//
//  ResumeModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ResumeModel: Codable {
    let resumeId: String
    var title: String
    let about: AboutContentModel
    let contact: ContactContentModel
    let careerObjective: CareerObjectiveContentModel
    let workSummary: WorkContentModel
    let skills: SkillContentModel
    let educationDetails: EducationContentModel
    let projectDetails: ProjectDetailsContentModel
    
    init() {
        self.resumeId = UUID().uuidString
        self.title = ""
        self.about = AboutContentModel()
        self.contact = ContactContentModel()
        self.careerObjective = CareerObjectiveContentModel()
        self.workSummary = WorkContentModel()
        self.skills = SkillContentModel()
        self.educationDetails = EducationContentModel()
        self.projectDetails = ProjectDetailsContentModel()
    }
}

extension ResumeModel {
    static func readResumes(for resumeId: String? = nil) -> [ResumeModel]? {
        //array of resume model [resume model]
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "resumesKey") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                //JSONDecoder is code for decoding provided by swift

                // Decode User
                let resumes = try decoder.decode([ResumeModel].self, from: data)
                guard let resumeId = resumeId else {
                    // To return all resumes
                    return resumes
                }
                
                // To return filtered resumes as per email
                let filteredResumes = resumes.filter {
                    $0.resumeId == resumeId
                }
                return filteredResumes

            } catch {
                debugPrint("Unable to Decode ResumeModel (\(error))")
            }
        }
        
        return nil
    }
    
    func writeResume() {
        self.title = self.about.firstName + " " + self.about.lastName
        
        var resumes = ResumeModel.readResumes() ?? [ResumeModel]()
        if resumes.isEmpty {
            resumes.append(self)
        } else {
            var resumeList = [ResumeModel]()
            var isExisting = false
            for existingResume in resumes {
                if existingResume.resumeId == self.resumeId {
                    //Replace by new resume
                    resumeList.append(self)
                    isExisting = true
                } else {
                    resumeList.append(existingResume)
                }
            }
            
            // Save new resume
            if isExisting == false {
                resumeList.append(self)
            }
            
            resumes = resumeList
        }

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
