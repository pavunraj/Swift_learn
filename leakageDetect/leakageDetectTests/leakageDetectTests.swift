//
//  leakageDetectTests.swift
//  leakageDetectTests
//
//  Created by PavunRaj on 05/11/26.
//

import Testing
import XCTest
@testable import leakageDetect
//struct leakageDetectTests {
//
//    @Test func example() async throws {
//        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
//        // Swift Testing Documentation
//        // https://developer.apple.com/documentation/testing
//        
//       
//        
//    }
//
//}


final class leakageDetectTests2: XCTestCase {
    
    func  testLeakageFunction() {
        let sut:leakageDetect?  = leakageDetect(name: "Hello pavun")
        weak var weakSut = sut
        sut?.leakageDetect()
        sut?.name = nil
        addTeardownBlock { [weak self] in
           XCTAssertNil(weakSut, "Object is not released")
        }
    }
   
    
}
