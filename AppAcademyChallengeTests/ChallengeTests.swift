//
//  ChallengeTests.swift
//  AppAcademyChallengeTests
//
//  Created by Thonatas Borges on 21/05/21.
//

import XCTest
@testable import AppAcademyChallenge

class ChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testPercentageShouldBeCorrect() {
        var candidateManager = CandidateManager()
        
        candidateManager.parseToCsv(with: "Mock_Challenge1.csv")
        
        let percentageAndroid = candidateManager.percentageCandidates(by: .android)
        let percentageIos = candidateManager.percentageCandidates(by: .iOS)
        let percentageQa = candidateManager.percentageCandidates(by: .qa)
        let count = candidateManager.candidates.count
        
        XCTAssertEqual(count, 10)
        XCTAssertEqual(percentageAndroid, 50.0)
        XCTAssertEqual(percentageIos, 30.0)
        XCTAssertEqual(percentageQa, 20.0)
    }
    
    func testAgeAveregeShouldBeCorrect() {
        var candidateManager = CandidateManager()
        candidateManager.parseToCsv(with: "Mock_Challenge2.csv")
        let ageAverage = candidateManager.ageAverageCandidates(by: .qa)
        
        XCTAssertEqual(ageAverage, "23.0 anos")
    }
    
    func testCountDisctinctStatesShouldBeCorrect() {
        var candidateManager = CandidateManager()
        candidateManager.parseToCsv(with: "Mock_Challenge3.csv")
        let countStates = candidateManager.distinctStatesQuantity()
        
        XCTAssertEqual(countStates.count, 9)
    }
}
