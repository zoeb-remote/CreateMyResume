//
//  ResumeViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class ResumeViewModelTests: XCTestCase
{
    class MockResumeViewModel: ResumeViewModel {
        private var reumeModel: MockResumeModel?
        static var readResumeWasCalled = false
        
        override var resumes: [ResumeModel]? {
            let _ = MockResumeViewModel.readResumes()
            guard let reumeModel = self.reumeModel else { return nil }
            
            return [reumeModel]
        }
        
        override static func readResumes(for resumeId: String? = nil) -> [ResumeModel]? {
            readResumeWasCalled = true
            return nil
        }
        
        func updateResume(resume: MockResumeModel) {
            self.reumeModel = resume
        }
    }
    
    class MockResumeModel: ResumeModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockResumeViewModel!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupResumeViewModel()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupResumeViewModel()
    {
        sut = MockResumeViewModel()
    }
    
    // MARK: Tests
    
    func testResumesCount()
    {
        let resume = MockResumeModel()
        sut.updateResume(resume: resume)
        
        XCTAssertEqual(sut.resumesCount, 1, "resumesCount should be 1")
    }
    
    func testReadResumesCall()
    {
        let _ = sut.resumes
        
        XCTAssertTrue(MockResumeViewModel.readResumeWasCalled, "readResumeWasCalled should be true")
    }
    
    func testResumeInfo() {
        // Given
        let resume = MockResumeModel()
        resume.title = "Test"
        resume.about.firstName = "Test1"
        resume.about.lastName = "Test2"
        
        // When
        sut.updateResume(resume: resume)
        
        // Then
        let resumeInfo = sut.resumes?.first
        
        XCTAssertEqual(resumeInfo?.title, "Test", "Resume's title should be Test")
    }
}
