//
//  ContentsViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class ContentsViewModelTests: XCTestCase
{
    class MockContentsViewModel: ContentsViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockContentsViewModel!
    
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
    
    func testContentsInfo() {
        // Given
        let resume = ResumeModel()
        
        let sut = MockContentsViewModel(resume: resume)
        
        // Then
        
        XCTAssertTrue(sut.records.contains("About"), "'About' should be present in records")
        XCTAssertTrue(sut.records.contains("Contact"), "'Contact' should be present in records")
        XCTAssertTrue(sut.records.contains("Career Objective"), "'Career Objective' should be present in records")
        XCTAssertTrue(sut.records.contains("Work"), "'Work' should be present in records")
        XCTAssertTrue(sut.records.contains("Skills"), "'Skills' should be present in records")
        XCTAssertTrue(sut.records.contains("Education"), "'Education' should be present in records")
        XCTAssertTrue(sut.records.contains("Project Details"), "'Project Details' should be present in records")
        XCTAssertTrue(sut.records.contains("Preview & Export"), "'Preview & Export' should be present in records")
    }
    
}
