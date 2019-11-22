import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MD5DigestPerformanceTests.allTests),
        testCase(MD5DigestTests.allTests),
    ]
}
#endif
