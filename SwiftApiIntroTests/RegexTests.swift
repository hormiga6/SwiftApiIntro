import XCTest

class RegexTests: XCTestCase {

  func testMatch() {
    let string = "Wikipedia is a free online encyclopedia, created and edited by volunteers around the world and hosted by the Wikimedia Foundation."

    let re = try? NSRegularExpression(pattern: "Wiki.edia")
    let number = re?.numberOfMatches(in: string, range: NSMakeRange(0, string.characters.count))

    XCTAssertEqual(number, 2)
  }

  func testNumber() {
    let string = "1984"
    let re = try? NSRegularExpression(pattern: "19\\d4")
    let number = re?.numberOfMatches(in: string, range: NSMakeRange(0, string.characters.count))

    XCTAssertEqual(number, 1)
  }
}
