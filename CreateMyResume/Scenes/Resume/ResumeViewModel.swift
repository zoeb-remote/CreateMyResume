//
//  ResumeViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ResumeViewModel {
    var resumes: [ResumeModel]? {
        return ResumeViewModel.readResumes()
    }
    
    var resumesCount: Int {
        resumes?.count ?? 0
    }
    
    enum Constants {
        static let cellIdentifier = "ResumeTableViewCell"
        static let addContentsViewControllerIdentifier = "AddContentsViewControllerIdentifier"
        static let modifyContentsViewControllerIdentifier = "ModifyContentsViewControllerIdentifier"
    }
    
    class func readResumes(for resumeId: String? = nil) -> [ResumeModel]? {
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
    
    class func writeResume(_ resume: ResumeModel) {
        resume.title = resume.about.firstName + " " + resume.about.lastName
        
        var resumes = ResumeViewModel.readResumes() ?? [ResumeModel]()
        if resumes.isEmpty {
            resumes.append(resume)
        } else {
            var resumeList = [ResumeModel]()
            var isExisting = false
            for existingResume in resumes {
                if existingResume.resumeId == resume.resumeId {
                    //Replace by new resume
                    resumeList.append(resume)
                    isExisting = true
                } else {
                    resumeList.append(existingResume)
                }
            }
            
            // Save new resume
            if isExisting == false {
                resumeList.append(resume)
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
        if let resumes = ResumeViewModel.readResumes() {
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
