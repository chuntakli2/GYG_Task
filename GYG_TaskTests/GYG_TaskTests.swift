//
//  GYG_TaskTests.swift
//  GYG_TaskTests
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import XCTest
@testable import GYG_Task

class GYG_TaskTests: XCTestCase {
    let TEST_TIME_OUT_INTERVAL = 5.0
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test Model
    
    func testReview() {
        let review = Review()
        XCTAssertEqual(review.reviewId, -1, "review id should be '-1'")
        XCTAssertEqual(review.rating, "", "review rating should be ''")
        XCTAssertEqual(review.title, "", "review title should be ''")
        XCTAssertEqual(review.message, "", "review message should be ''")
        XCTAssertEqual(review.author, "", "review author should be ''")
        XCTAssertEqual(review.date, "", "review date should be ''")
    }

    // Test DataManager
    
    func testGetReviews() {
        let expectation = self.expectation(description: "getReviewsExpectation")
        DataManager.sharedInstance.getReviews(callback: { (total: Int, reviews: [Review]?, error: Error?) in
            XCTAssertNil(error, "Retuen error from getReviews")
            if let reviews = reviews {
                XCTAssertGreaterThan(reviews.count, 0, "Should return some reviews from server")
                expectation.fulfill()
            }
        })
        self.waitForExpectations(timeout: TEST_TIME_OUT_INTERVAL) { (error: Error?) in
            XCTAssertNil(error, "Retuen error from waitForExpectationsWithTimeout")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
