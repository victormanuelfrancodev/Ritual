import XCTest
@testable import Ritual

class RitualTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testTaskInitialization() {
    let emptyTask = Task.init(description: "", notes: nil)
    XCTAssertNil(emptyTask)
  }
  
}
