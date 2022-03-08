//
//  EducationViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class EducationViewModelTests: XCTestCase
{
    class MockEducationViewModel: EducationViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockEducationViewModel!
    
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
    
    func testEducationInfo() {
        // Given
        let educationModel = EducationContentModel()
        let addEducationModel = AddEducationModel()
        addEducationModel.classDetails = "Test"
        addEducationModel.passingYear = 2020
        addEducationModel.percentage = 90.5
        educationModel.educationModels.append(addEducationModel)
        
        let sut = MockEducationViewModel(contentModel: educationModel)
        
        // Then
        
        XCTAssertEqual(sut.contentModel.educationModels.first?.classDetails, "Test", "classDetails should be 'Test'")
        
        XCTAssertEqual(sut.contentModel.educationModels.first?.passingYear, 2020, "passingYear should be '2020'")
        
        XCTAssertEqual(sut.contentModel.educationModels.first?.percentage, 90.5, "percentage should be '90.5'")
        
        XCTAssertTrue(sut.contentModel.educationModels.isEmpty == false, "educationModels should not be empty")
    }
    
}
