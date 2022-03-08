//
//  WorkViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class WorkViewModelTests: XCTestCase
{
    class MockWorkViewModel: WorkViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockWorkViewModel!
    
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
    
    func testWorkInfo() {
        // Given
        let workModel = WorkContentModel()
        workModel.totalExperience = "10 Years"
        let addWorkModel = AddWorkModel()
        addWorkModel.companyName = "ABC Test"
        addWorkModel.duration = "5 Years"
        addWorkModel.isCurrentCompany = true
        workModel.workModels.append(addWorkModel)
        
        let sut = MockWorkViewModel(contentModel: workModel)
        
        // Then
        
        XCTAssertEqual(sut.contentModel.totalExperience, "10 Years", "totalExperience should be '10 Years'")
        
        XCTAssertEqual(sut.contentModel.workModels.first?.companyName, "ABC Test", "companyName should be 'ABC Test'")
        
        XCTAssertEqual(sut.contentModel.workModels.first?.duration, "5 Years", "duration should be '5 Years'")
        
        XCTAssertTrue(sut.contentModel.workModels.first?.isCurrentCompany ?? false, "isCurrentCompany should be true")
        
        XCTAssertTrue(sut.contentModel.workModels.isEmpty == false, "workModels should not be empty")
    }
    
}
