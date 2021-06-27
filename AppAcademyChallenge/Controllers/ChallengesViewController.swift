//
//  ChallengesViewController.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit
import SnapKit

class ChallengesViewController: UIViewController {
    
    // MARK: - IBOutlets
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var percentageCandidatesByCoursesView: UIView = {
        let view = UIView()
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToGraph(sender:)))
//        view.addGestureRecognizer(gesture)
//        view.tag = 1
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var iOSLabel: UILabel = {
        let label = UILabel()
        let percentage = String(format: "%.1f", candidateManager.percentageCandidates(by: .iOS))
        label.text = "  iOS: \(percentage) %"
        label.backgroundColor = Colors.ios
        label.textColor = .white
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var androidLabel: UILabel = {
        let label = UILabel()
        let text = String(format: "%.1f", candidateManager.percentageCandidates(by: .android))
        label.text = "  Android: \(text) %"
        label.backgroundColor = Colors.android
        label.textColor = .white
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var qaLabel: UILabel = {
        let label = UILabel()
        let average = String(format: "%.1f", candidateManager.percentageCandidates(by: .qa))
        label.text = "  QA: \(average) %"
        label.backgroundColor = Colors.qa
        label.textColor = .white
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageAverageView: UIView = {
        let view = UIView()
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToCandidateList(sender:)))
//        view.addGestureRecognizer(gesture)
//        view.tag = 1
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var ageAverageLabel: UILabel = {
        let label = UILabel()
        let text = candidateManager.ageAverageCandidates(by: .qa)
        label.text = """
           Média de Idade dos
           Candidatos de QA:
           \(text)
        """
        label.backgroundColor = Colors.qa
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var distinctStatesView: UIView = {
        let view = UIView()
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToMap(sender:)))
//        view.addGestureRecognizer(gesture)
//        view.tag = 1
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var distinctStateLabel: UILabel = {
        let label = UILabel()
        let states = candidateManager.distinctStatesQuantity()
        let count = states.count
        label.text = """
           Quantidade de Estados
           Distintos: \(count)
        """
        label.backgroundColor = Colors.other
        label.textColor = Colors.ios
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var theFewestStatesByCandidatesView: UIView = {
        let view = UIView()
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkActionToMap(sender:)))
//        view.addGestureRecognizer(gesture)
//        view.tag = 1
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "   Estados com menos candidato(s)"
        label.backgroundColor = Colors.android
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = .preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var firstStateLabel: UILabel = {
        let label = UILabel()
        let states = candidateManager.statesWithTheFewestOccurrences()
        let stateName = states[0].key
        let stateQuantity = states[0].value
        label.text = "   \(stateName): \(stateQuantity) candidato(s)"
        label.backgroundColor = Colors.android
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var secondStateLabel: UILabel = {
        let label = UILabel()
        let states = candidateManager.statesWithTheFewestOccurrences()
        let stateName = states[1].key
        let stateQuantity = states[1].value
        label.text = "   \(stateName): \(stateQuantity) candidato(s)"
        label.backgroundColor = Colors.android
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var candidateManager = CandidateManager()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
            
        candidateManager.parseToCsv()
        setupView()
    
    }
}
// MARK: - Actions Functions
extension ChallengesViewController {
        
    @objc func checkActionToGraph(sender : UITapGestureRecognizer) {
        //go(to: .graph)
        let viewController = PieChartViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func checkActionToMap(sender : UITapGestureRecognizer) {
        let viewController = MapViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func checkActionToCandidateList(sender : UITapGestureRecognizer) {
        let viewController = CandidatesListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
    
// MARK: - Layout & Constraints
extension ChallengesViewController {
    
    private func setupView() {
        addMainScrollView()
        
        addPercentageCandidatesByCoursesView()
        addIosLabel()
        addAndroidLabel()
        addQaLabel()
        
        addAgeAverageView()
        addAgeAverageLabel()
        
        addDistinctStatesView()
        addDistinctStatesLabel()
        
        addTheFewestStatesByCandidatesView()
        addDescriptionLabel()
        addFirstStateLabel()
        addSecondStateLabel()
    }
    
    private func addMainScrollView() {
        self.view.addSubview(mainScrollView)
        
        mainScrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.centerX.width.equalTo(self.view)
        }
    }
    
    private func addPercentageCandidatesByCoursesView() {
        mainScrollView.addSubview(percentageCandidatesByCoursesView)
        
        
        
        percentageCandidatesByCoursesView.snp.makeConstraints { make in
            make.top.equalTo(mainScrollView).offset(20)
            make.leading.equalTo(mainScrollView).offset(20)
            make.trailing.equalTo(mainScrollView).offset(-20)
            make.width.greaterThanOrEqualTo(mainScrollView).offset(-40)
            make.height.equalTo(180)
        }
    }

    private func addIosLabel() {
        percentageCandidatesByCoursesView.addSubview(iOSLabel)
        
        iOSLabel.snp.makeConstraints { make in
            make.top.equalTo(percentageCandidatesByCoursesView)
            make.leading.trailing.equalTo(percentageCandidatesByCoursesView)
            make.height.equalTo(percentageCandidatesByCoursesView).dividedBy(3)
        }
    }
    
    private func addAndroidLabel() {
        percentageCandidatesByCoursesView.addSubview(androidLabel)
        
        androidLabel.snp.makeConstraints { make in
            make.top.equalTo(iOSLabel.snp.bottom)
            make.leading.trailing.equalTo(percentageCandidatesByCoursesView)
            make.height.equalTo(percentageCandidatesByCoursesView).dividedBy(3)
        }
    }
    
    private func addQaLabel() {
        percentageCandidatesByCoursesView.addSubview(qaLabel)
        
        qaLabel.snp.makeConstraints { make in
            make.top.equalTo(androidLabel.snp.bottom)
            make.leading.trailing.equalTo(percentageCandidatesByCoursesView)
            make.height.equalTo(percentageCandidatesByCoursesView).dividedBy(3)
        }
    }
    
    private func addAgeAverageView() {
        mainScrollView.addSubview(ageAverageView)
        
        ageAverageView.snp.makeConstraints { make in
            make.top.equalTo(percentageCandidatesByCoursesView.snp.bottom).offset(20)
            make.leading.equalTo(mainScrollView).offset(20)
            make.trailing.equalTo(mainScrollView).offset(-20)
            make.width.greaterThanOrEqualTo(mainScrollView).offset(-40)
            make.height.equalTo(180)
        }
    }
    
    private func addAgeAverageLabel() {
        ageAverageView.addSubview(ageAverageLabel)
        
        ageAverageLabel.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(ageAverageView)
        }
    }
    
    private func addDistinctStatesView() {
        mainScrollView.addSubview(distinctStatesView)
        
        distinctStatesView.snp.makeConstraints { make in
            make.top.equalTo(ageAverageView.snp.bottom).offset(20)
            make.leading.equalTo(mainScrollView).offset(20)
            make.trailing.equalTo(mainScrollView).offset(-20)
            make.width.greaterThanOrEqualTo(mainScrollView).offset(-40)
            make.height.equalTo(180)
        }
    }

    private func addDistinctStatesLabel() {
        distinctStatesView.addSubview(distinctStateLabel)
        
        distinctStateLabel.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(distinctStatesView)
        }
    }
    
    private func addTheFewestStatesByCandidatesView() {
        mainScrollView.addSubview(theFewestStatesByCandidatesView)
        
        theFewestStatesByCandidatesView.snp.makeConstraints { make in
            make.top.equalTo(distinctStatesView.snp.bottom).offset(20)
            make.leading.equalTo(mainScrollView).offset(20)
            make.trailing.equalTo(mainScrollView).offset(-20)
            make.width.greaterThanOrEqualTo(mainScrollView).offset(-40)
            make.height.equalTo(180)
            make.bottom.equalTo(mainScrollView)
        }
    }
    
    private func addDescriptionLabel() {
        theFewestStatesByCandidatesView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(theFewestStatesByCandidatesView)
            make.height.equalTo(theFewestStatesByCandidatesView).dividedBy(3)
        }
    }
    
    private func addFirstStateLabel() {
        theFewestStatesByCandidatesView.addSubview(firstStateLabel)
        
        firstStateLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.trailing.equalTo(theFewestStatesByCandidatesView)
            make.height.equalTo(theFewestStatesByCandidatesView).dividedBy(3)
        }
    }
    
    private func addSecondStateLabel() {
        theFewestStatesByCandidatesView.addSubview(secondStateLabel)
        
        secondStateLabel.snp.makeConstraints { make in
            make.top.equalTo(firstStateLabel.snp.bottom)
            make.leading.trailing.equalTo(theFewestStatesByCandidatesView)
            make.height.equalTo(theFewestStatesByCandidatesView).dividedBy(3)
        }
    }
    
}

enum Controllers: Int {
    case map = 0
    case graph = 1
    case candidates = 2
    
    var name: UIViewController {
        switch self {
        case .map:
            return MapViewController()
        case .graph:
            return PieChartViewController()
        case .candidates:
            return CandidatesListViewController()
        }
    }
}

