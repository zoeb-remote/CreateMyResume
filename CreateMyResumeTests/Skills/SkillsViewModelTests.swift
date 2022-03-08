//
//  SkillsViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class SkillsViewModelTests: XCTestCase
{
    class MockSkillsViewModel: SkillsViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockSkillsViewModel!
    
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
    
    func testSkillsInfo() {
        // Given
        let skillModel = SkillContentModel()
        let addSkillModel = AddSkillModel()
        addSkillModel.skill = "Swift"
        skillModel.skillModels.append(addSkillModel)
        
        let sut = MockSkillsViewModel(contentModel: skillModel)
        
        // Then
        
        XCTAssertEqual(sut.contentModel.skillModels.first?.skill, "Swift", "skill should be 'Swift'")
        
        XCTAssertTrue(sut.contentModel.skillModels.isEmpty == false, "skillModels should not be empty")
    }
    
}
