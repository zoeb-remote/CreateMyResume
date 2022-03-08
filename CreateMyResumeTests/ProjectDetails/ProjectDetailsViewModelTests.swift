//
//  ProjectDetailsViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class ProjectDetailsViewModelTests: XCTestCase
{
    class MockProjectDetailsViewModel: ProjectDetailsViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockProjectDetailsViewModel!
    
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
    
    func testProjectDetailsInfo() {
        // Given
        let projectDetailsModel = ProjectDetailsContentModel()
        let addProjectModel = AddProjectModel()
        addProjectModel.projectName = "ABC Test"
        addProjectModel.summary = "Test summary"
        addProjectModel.teamSize = 5
        addProjectModel.technologyUsed = "Test"
        addProjectModel.role = "Developer"
        projectDetailsModel.projectsModels.append(addProjectModel)
        
        let sut = MockProjectDetailsViewModel(contentModel: projectDetailsModel)
        
        // Then
        
        XCTAssertEqual(sut.contentModel.projectsModels.first?.projectName, "ABC Test", "projectName should be 'ABC Test'")
        
        XCTAssertEqual(sut.contentModel.projectsModels.first?.summary, "Test summary", "summary should be 'Test summary'")
        
        XCTAssertEqual(sut.contentModel.projectsModels.first?.teamSize, 5, "teamSize should be '5'")
        
        XCTAssertEqual(sut.contentModel.projectsModels.first?.technologyUsed, "Test", "technologyUsed should be 'Test'")
        
        XCTAssertEqual(sut.contentModel.projectsModels.first?.role, "Developer", "role should be 'Developer'")
        
        XCTAssertTrue(sut.contentModel.projectsModels.isEmpty == false, "projectsModels should not be empty")
    }
    
}
