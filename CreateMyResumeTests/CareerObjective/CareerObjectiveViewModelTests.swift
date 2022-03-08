//
//  CareerObjectiveViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class CareerObjectiveViewModelTests: XCTestCase
{
    class MockCareerObjectiveViewModel: CareerObjectiveViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockCareerObjectiveViewModel!
    
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
    
    func testCareerObjectiveInfo() {
        // Given
        let careerObjectiveModel = CareerObjectiveContentModel()
        careerObjectiveModel.objective = "Test"
        
        let sut = MockCareerObjectiveViewModel(contentModel: careerObjectiveModel)
        
        // Then
        
        XCTAssertEqual(sut.contentModel.objective, "Test", "objective should be 'Test'")
    }
    
}
