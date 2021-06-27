//
//  CandidateManager.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 18/05/21.
//

import Foundation

struct CandidateManager {
    
    // MARK: - Variables
    
    var candidates = [Candidate]()
    let filenameString = "AppAcademy_Candidates.csv"
    
    // MARK: - Candidates Functions
    
    func percentageCandidates(by course: Course) -> Double {
        var total = 0.0
        var partial = 0.0
        
        for index in 0..<candidates.count {
            if candidates[index].course == course.rawValue {
                partial += 1
            }
            total += 1
        }
        
        let percentage = partial / total * 100
        return percentage
    }
    
    func ageAverageCandidates(by course: Course) -> String {
        var sumAges = 0.0
        var countAges = 0.0
        
        for index in 0..<candidates.count {
            if candidates[index].course == course.rawValue {
                sumAges += Double(candidates[index].age)
                countAges += 1.0
            }
        }
        let average = sumAges / countAges
        let averageString = String(format: "%.1f", average)

        return "\(averageString) anos"
    }
    
    // MARK: - CSV Functions
    
    mutating func parseToCsv(with fileName: String = "AppAcademy_Candidates.csv") {
        
        guard let inputPath = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("erro ao encontrar caminho para o arquivo CSV")
        }

        do {
          let input = try String(contentsOf: inputPath).components(separatedBy: "\n")
          for lineNumber in 1..<input.count-1 {
            let fields = input[lineNumber].components(separatedBy: ",")

            for fieldNumber in 0..<fields.count {
                let item = fields[fieldNumber].components(separatedBy: ";")
                let name = item[0]
                let course = item[1]
                let age = item[2]
                let state = item[3]

                let candidate = Candidate(fullName: name, course: course, age: age, state: state)
                candidates.append(candidate)
            }
          }
            candidates = candidates.sorted { $0.fullName.localizedCaseInsensitiveCompare($1.fullName) == ComparisonResult.orderedAscending }

        } catch {
          print("Sorry, something went wrong and we couldn't process your request")
        }
    }
    
    func exportToCsv() {
        
        var candidatesArray: [Candidate] = []
        
        for index in 0..<candidates.count {
            let fullName = candidates[index].fullName
            let course = candidates[index].course
            let age = candidates[index].ageString
            let state = candidates[index].state
            let newCandidate = Candidate(fullName: fullName, course: course, age: age, state: state)
            candidatesArray.append(newCandidate)
        }
        
        let outputFileName = "Sorted_AppAcademy_Candidates.csv"
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let path = documentDirectory.appendingPathComponent(outputFileName)
        var csvText = "Nome;Vaga;Idade;Estado\n"
        
        for candidate in candidatesArray {
            let newLine = "\(candidate.fullName);\(candidate.course);\(candidate.age);\(candidate.state)\n"
            csvText.append(newLine)
        }
        
        do {
            try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
    }
    
    // MARK: - States Functions
    
    mutating func distinctStatesQuantity() -> [String] {
        var states: [String] = []
        
        for index in 0..<candidates.count {
            let state = candidates[index].state
            if !states.contains(state) {
                states.append(state)
            }
        }
        return states
    }
    
    mutating func returnAllStates() -> [String] {
        var statesForMap: [String] = []
        let states = distinctStatesQuantity()
        
        for index in 0..<states.count {
            let state = states[index]
            let stateFullName = getStateFullName(state: state)
            statesForMap.append(stateFullName)
        }
        return statesForMap
    }
    
    func statesWithTheFewestOccurrences() -> [Dictionary<String, Int>.Element] {
        var states: [String] = []
        var counts: [String: Int] = [:]
        
        for index in 0..<candidates.count {
            let state = candidates[index].state
            states.append(state)
        }
        
        for index in states {
           counts[index] = (counts[index] ?? 0) + 1
        }
        
        let sorted = counts.sorted(by: <)
        return sorted

    }
    
    func getStateFullName(state: String) -> String {
        let newEnum = States.allCases
        var results: [String] = []
        
        for index in 0..<newEnum.count {
            let result = "\(newEnum[index])"
            let resultRawValue = "\(newEnum[index].rawValue), \(result), Brasil"
            
            if result == state {
                results.append(resultRawValue)
            }
        }
        return results[0]
    }
    
    // MARK: - Instructors Functions
    
    func filterPossibleInstructors(by course: Course) -> [Candidate] {
        if course.rawValue == "iOS" {
            let possibleInstructors = candidates.filter { $0.isPossibleIosInstructor == true}
            return possibleInstructors
        } else if course.rawValue == "Android" {
            let possibleInstructors = candidates.filter { $0.isPossibleAndroidInstructor == true}
            return possibleInstructors
        } else {
            return []
        }
    }
    
    func showInstructor(of course: Course) -> Candidate? {
        var sameDecadeArray = intersectionBySameDecadeOfBirth()
        var agesArray = intersectionByAge()
        var results: [Candidate] = []
        
        if course == .iOS {
            sameDecadeArray = sameDecadeArray.filter { $0.isPossibleIosInstructor }
            agesArray = agesArray.filter { $0.isPossibleIosInstructor }
            results += sameDecadeArray
            results += agesArray
        } else if course == .android {
            sameDecadeArray = sameDecadeArray.filter { $0.isPossibleAndroidInstructor }
            agesArray = agesArray.filter { $0.isPossibleAndroidInstructor }
            results += sameDecadeArray
            results += agesArray
        }
        
        return results.first
    }
        
    func intersectionBySameDecadeOfBirth() -> [Candidate] {
        
        let firstArray = filterPossibleInstructors(by: .iOS)
        let secondArray = filterPossibleInstructors(by: .android)
        
        var resultArray: [Candidate] = []
        for first in 0..<firstArray.count {
            for second in 0..<secondArray.count {
                if firstArray[first].decadeOfBirth == secondArray[second].decadeOfBirth {
                    resultArray.append(firstArray[first])
                    resultArray.append(secondArray[second])
                }
            }
        }
        return resultArray
    }
    
    func intersectionByAge() -> [Candidate] {
        var resultArray: [Candidate] = []
        let firstArray = filterPossibleInstructors(by: .android)
        let secondArray = filterPossibleInstructors(by: .iOS)
        
        for first in 0..<firstArray.count {
            for second in 0..<secondArray.count {
                if firstArray[first].age < secondArray[second].age {
                    resultArray.append(firstArray[first])
                    resultArray.append(secondArray[second])
                }
            }
        }
        return resultArray
    }

}
