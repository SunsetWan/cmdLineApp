import XCTest

import cmdLineAppTests

var tests = [XCTestCaseEntry]()
tests += cmdLineAppTests.allTests()
XCTMain(tests)
