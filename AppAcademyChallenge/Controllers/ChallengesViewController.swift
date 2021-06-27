//
//  ChallengesViewController.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit
import Charts

class ChallengesViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var percentageCandidatesByCoursesView: UIView!
    @IBOutlet weak var ageAverageView: UIView!
    @IBOutlet weak var distinctStatesView: UIView!
    @IBOutlet weak var theFewestStatesByCandidatesView: UIView!
    
    @IBOutlet weak var iosSubView: UIView!
    @IBOutlet weak var androidSubView: UIView!
    @IBOutlet weak var qaSubView: UIView!
    
    @IBOutlet weak var iosLabel: UILabel!
    @IBOutlet weak var androidLabel: UILabel!
    @IBOutlet weak var qaLabel: UILabel!
    @IBOutlet weak var ageAverageLabel: UILabel!
    @IBOutlet weak var distinctStateLabel: UILabel!
    @IBOutlet weak var firstStateLabel: UILabel!
    @IBOutlet weak var secondStateLabel: UILabel!
    
    var candidateManager = CandidateManager()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        candidateManager.parseToCsv()
        updatePercentageCandidatesView()
        updateAgeAverageView()
        updateDistinctStateView()
        updateFewestStatesView()
    
    }
    
    // MARK: - Actions Functions
    
    @objc func checkActionToGraph(sender : UITapGestureRecognizer) {
        go(to: .graph)
    }
    
    @objc func checkActionToMap(sender : UITapGestureRecognizer) {
        go(to: .map)
    }
    
    @objc func checkActionToCandidateList(sender : UITapGestureRecognizer) {
        go(to: .canidates)
    }
    
    func go(to identifier: Identifiers) {
        let viewController: UIViewController = self.storyboard!.instantiateViewController(withIdentifier: identifier.rawValue)
        self.present(viewController, animated: true, completion: nil)
    }
    
    // MARK: - Update Layout Functions
    
    func updatePercentageCandidatesView() {
        
//        let percentageIos = String(format: "%.1f", candidateManager.percentageCandidates(by: .iOS))
//        let percentageAndroid = String(format: "%.1f", candidateManager.percentageCandidates(by: .android))
//        let percentageQa = String(format: "%.1f", candidateManager.percentageCandidates(by: .qa))
//
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToGraph))
//        self.percentageCandidatesByCoursesView.addGestureRecognizer(gesture)
//
//        percentageCandidatesByCoursesView.layer.cornerRadius = 15
//        percentageCandidatesByCoursesView.layer.masksToBounds = true
//        iosSubView.backgroundColor = Colors.ios
//        androidSubView.backgroundColor = Colors.android
//        qaSubView.backgroundColor = Colors.qa
//        iosLabel.text = "iOS: \(percentageIos) %"
//        androidLabel.text = "Android: \(percentageAndroid) %"
//        qaLabel.text = "QA: \(percentageQa) %"
        
    }
    
    func updateAgeAverageView() {
//        let average = candidateManager.ageAverageCandidates(by: .qa)
//
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToCandidateList))
//        self.ageAverageView.addGestureRecognizer(gesture)
//
//        ageAverageView.layer.cornerRadius = 15
//        ageAverageView.layer.masksToBounds = true
//        ageAverageView.backgroundColor = Colors.qa
//        ageAverageLabel.text = "Média de Idade dos Candidatos de QA: \(average)"
    }
    
    func updateDistinctStateView() {
//        let states = candidateManager.distinctStatesQuantity()
//        let count = states.count
//
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToMap))
//        self.distinctStatesView.addGestureRecognizer(gesture)
//
//        distinctStatesView.layer.cornerRadius = 15
//        distinctStatesView.layer.masksToBounds = true
//        distinctStatesView.backgroundColor = Colors.other
//        distinctStateLabel.text = "Quantidade de Estados Distintos: \(count)"
    }
    
    func updateFewestStatesView() {
//        let states = candidateManager.statesWithTheFewestOccurrences()
//        let firstStateName = states[0].key
//        let firstStateQuantity = states[0].value
//        let secondStateName = states[1].key
//        let secondStateQuantity = states[1].value
//        
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToMap))
//        self.theFewestStatesByCandidatesView.addGestureRecognizer(gesture)
//        
//        theFewestStatesByCandidatesView.layer.cornerRadius = 15
//        theFewestStatesByCandidatesView.layer.masksToBounds = true
//        theFewestStatesByCandidatesView.backgroundColor = Colors.android
//        
//        firstStateLabel.text = "\(firstStateName): \(firstStateQuantity) candidato(s)"
//        secondStateLabel.text = "\(secondStateName): \(secondStateQuantity) candidato(s)"
        
    
    }
}

enum Identifiers: String {
    case map = "Map"
    case graph = "Graph"
    case canidates = "CandidatesList"
}

