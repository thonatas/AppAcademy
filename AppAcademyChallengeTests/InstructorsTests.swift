//
//  InstructorsTests.swift
//  AppAcademyChallengeTests
//
//  Created by Thonatas Borges on 21/05/21.
//

import XCTest
@testable import AppAcademyChallenge

class InstructorsTests: XCTestCase {
    
    let candidate1 = Candidate(fullName: "Instrutor VIos", course: "QA", age: "29 anos", state: "SC")
    let candidate2 = Candidate(fullName: "Instrutro Android", course: "QA", age: "27 anos", state: "SC")
    let candidate3 = Candidate(fullName: "Google Android", course: "Android", age: "56 anos", state: "RJ")
    let candidate4 = Candidate(fullName: "Apple Ios", course: "iOS", age: "18 anos", state: "AM")
    
//    [X] o instrutor de Android é mais novo do que o instrutor do iOS
//    [X] os instrutores nasceram na mesma década
//
//    [X] a idade dos instrutores é um número ímpar
//    [X] os instrutores tem menos de 31 anos
//    [X] a vaga atribuída aos instrutores (na planilha) não é a vaga na qual eles vão instruir
//    [X] os instrutores são de SC
//
//    [X] o instrutor de iOS tem mais de 20 anos
//    [X] a idade do instrutor de iOS é um número primo
//    [X] a primeira letra do último nome do instrutor de iOS é a letra "V"
//
//    [X] o primeiro nome do instrutor de Android tem 3 vogais
//    [X] a última letra do primeiro nome do instrutor de Android é a letra "o"
    
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShowInstructorsShoudBeCorrect() {
        let candidates: [Candidate] = [candidate1, candidate2, candidate3, candidate4]
        let candidateManager = CandidateManager(candidates: candidates)
        
        let iosIntructor = candidateManager.showInstructor(of: .iOS)
        let androidInstructor = candidateManager.showInstructor(of: .android)
        
        XCTAssertEqual(iosIntructor?.fullName, candidate1.fullName)
        XCTAssertEqual(androidInstructor?.fullName, candidate2.fullName)
        XCTAssertNotEqual(iosIntructor?.fullName, candidate2.fullName)
        XCTAssertNotEqual(androidInstructor?.fullName, candidate1.fullName)
    }

}
