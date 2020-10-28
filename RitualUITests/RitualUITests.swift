import XCTest

class RitualUITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }
  
  override func tearDown() {    
    super.tearDown()
  }
  
  func testAddAndCancel() {
    let app = XCUIApplication()
    app.navigationBars["Your Tasks"].buttons["Add"].tap()
    XCTAssert(app.navigationBars["New Task"].exists)
    app.navigationBars["New Task"].buttons["Cancel"].tap()
    XCTAssert(app.navigationBars["Your Tasks"].exists)
  }
  
}
