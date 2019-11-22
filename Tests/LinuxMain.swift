import XCTest

import SwiftDigestTests

XCTMain([
    testCase(MD5DigestPerformanceTests.allTests),
    testCase(MD5DigestTests.allTests),
])