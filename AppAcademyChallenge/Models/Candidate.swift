//
//  Candidate.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 18/05/21.
//

import Foundation

struct Candidate {
    var fullName: String
    var course: String
    var ageString: String
    var state: String
        
    var age: Int {
        let newString = ageString.prefix(2)
        if let ageNumber = Int(newString) {
            return ageNumber
        } else {
            print("Erro ao converter para número")
            return 0
        }
    }
    
    var firstName: String {
        let name = fullName.components(separatedBy: " ")
        return name[0]
    }
    
    var lastName: String {
        let name = fullName.components(separatedBy: " ")
        return name[1]
    }
    
    var decadeOfBirth: Int {
        let yearOfBirth = 2021 - age
        if yearOfBirth % 10 == 0 {
            return yearOfBirth / 10
        } else {
            return yearOfBirth / 10 - 1
        }
    }
    
    var isPossibleInstructor: Bool {
        let result = isOddAge() &&
                    isFormState(of: .SC) &&
                    isYounger(than: 31)
        
        return result
    }
    
    var isPossibleAndroidInstructor: Bool {
        let result = isNotCourse(of: .android) &&
                    containsVowels(in: firstName, qtyVowels: 3) &&
                    containsLetter("o", in: firstName, positionOfLetter: .last) &&
                    isPossibleInstructor
        
        return result
    }
    
    var isPossibleIosInstructor: Bool {
        let result = isPossibleInstructor &&
            isNotCourse(of: .iOS) &&
            isOlder(than: 20) &&
            isPrimeAge() &&
            containsLetter("V", in: lastName, positionOfLetter: .first)
        
        return result
    }
    
    init(fullName: String, course: String, age: String, state: String) {
        self.fullName = fullName
        self.course = course
        self.ageString = age
        self.state = state
    }
    
    // MARK: - Functions
    
    private func isPrimeAge() -> Bool {
        let ageNumber = age.isPrime
        return ageNumber
    }
    
    private func isOlder(than otherAge: Int) -> Bool {
        return age > otherAge
    }
    
    private func isYounger(than otherAge: Int) -> Bool {
        return age < otherAge
    }
    
    private func isNotCourse(of courseChoice: Course) -> Bool {
        return courseChoice.rawValue != course
    }
    
    private func containsLetter(_ letter: String, in name: String, positionOfLetter: Position) -> Bool {
        if positionOfLetter == .first {
            if name.first?.uppercased() == letter { return true }
        } else {
            if name.last?.lowercased() == letter { return true }
        }
        return false
    }
    
    private func containsVowels(in name: String, qtyVowels: Int) -> Bool {
        var vowels = 0
        for letter in firstName {
            switch String(letter).lowercased() {
            case "a", "e", "i", "o", "u":
                vowels += 1
            default:
                break
            }
        }
        return vowels == qtyVowels
    }
    
    private func isFormState(of stateFrom: States) -> Bool {
        let stateString = "\(stateFrom)"
        return stateString == state
    }
    
    private func isOddAge() -> Bool {
        return age % 2 == 1
    }

}


enum Position: String {
    case first
    case last
}


extension Int {
    var isPrime: Bool {
        guard self >= 2     else { return false }
        guard self != 2     else { return true  }
        guard self % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(self))), by: 2).contains { self % $0 == 0 }
    }
}
