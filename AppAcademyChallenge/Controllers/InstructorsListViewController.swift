//
//  InstructorsListViewController.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit
import SnapKit

class InstructorsListViewController: UIViewController {
    
    private lazy var iosInstructorView: InstructorView = {
        let view = InstructorView()
        guard let instructor = candidateManager.showInstructor(of: .iOS) else { return InstructorView()}
        view.setup(with: .iOS, instructor: instructor)
        return view
    }()
    
    private lazy var androidInstructorView: InstructorView = {
        let view = InstructorView()
        guard let instructor = candidateManager.showInstructor(of: .android) else { return InstructorView()}
        view.setup(with: .android, instructor: instructor)
        return view
    }()
    
    
    var candidateManager = CandidateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateManager.parseToCsv()
        addIosInstructorView()
        addAndroidInstructorView()
    }
}

extension InstructorsListViewController {
    func addIosInstructorView() {
        self.view.addSubview(iosInstructorView)
        
        iosInstructorView.snp.makeConstraints { make in
            make.leading.equalTo(self.view).offset(15)
            make.trailing.equalTo(self.view).offset(-15)
            make.height.equalTo(self.view).multipliedBy(0.35)
        }
    }
    
    func addAndroidInstructorView() {
        self.view.addSubview(androidInstructorView)
        
        androidInstructorView.snp.makeConstraints { make in
            make.top.equalTo(iosInstructorView.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(self.view).offset(15)
            make.trailing.equalTo(self.view).offset(-15)
            make.height.equalTo(self.view).multipliedBy(0.35)
        }
    }
}
