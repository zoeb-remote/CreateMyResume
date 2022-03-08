//
//  AboutViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class AboutViewModelTests: XCTestCase
{
    class MockAboutViewModel: AboutViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockAboutViewModel!
    
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
    
    func testAboutInfo() {
        // Given
        let aboutModel = AboutContentModel()
        aboutModel.firstName = "Test1"
        aboutModel.lastName = "Test2"
        
        let sut = MockAboutViewModel(contentModel: aboutModel, resumeId: "")
        
        // Then
        
        XCTAssertEqual(sut.contentModel.firstName, "Test1", "firstName should be 'Test1'")
        
        XCTAssertEqual(sut.contentModel.lastName, "Test2", "lastName should be 'Test2'")
    }
    
}
