//
//  PDFResumeViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class PDFResumeViewModelTests: XCTestCase
{
    
    // MARK: Subject under test
    
    var sut: PDFResumeViewModel!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Tests
    
    func testEmptyPDFResumeSkillsText() {
        // Given
        let resume = ResumeModel()
        
        let sut = PDFResumeViewModel(resumeModel: resume)
        
        // Then
        
        XCTAssertTrue(sut.skillsText.isEmpty, "skillsText should be empty")
    }
    
    func testPDFResumeSkillsText() {
        // Given
        let resume = ResumeModel()
        let swiftSkillModel = AddSkillModel()
        swiftSkillModel.skill = "Swift"
        resume.skills.skillModels.append(swiftSkillModel)
        
        let objcSkillModel = AddSkillModel()
        objcSkillModel.skill = "Objective C"
        resume.skills.skillModels.append(objcSkillModel)
        
        let sut = PDFResumeViewModel(resumeModel: resume)
        
        // Then
        
        XCTAssertEqual(sut.skillsText, "Swift, Objective C", "skillsText should be 'Swift, Objective C'")
    }
}
