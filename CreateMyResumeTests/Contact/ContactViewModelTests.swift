//
//  ContactViewModelTests.swift
//  CreateMyResumeTests
//
//  Created by Zoeb on 08/03/22.
//

@testable import CreateMyResume
import XCTest

class ContactViewModelTests: XCTestCase
{
    class MockContactViewModel: ContactViewModel {
    }
    
    // MARK: Subject under test
    
    var sut: MockContactViewModel!
    
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
    
    func testContactInfo() {
        // Given
        let contactModel = ContactContentModel()
        contactModel.mobile = "1234567890"
        contactModel.email = "test@gmail.com"
        contactModel.address = "ABC Apartment, Japan"
        
        let sut = MockContactViewModel(contentModel: contactModel)
        
        // Then
        
        XCTAssertEqual(sut.contentModel.mobile, "1234567890", "mobile should be '1234567890'")
        
        XCTAssertEqual(sut.contentModel.email, "test@gmail.com", "email should be 'test@gmail.com'")
        
        XCTAssertEqual(sut.contentModel.address, "ABC Apartment, Japan", "address should be 'ABC Apartment, Japan'")
    }
}
