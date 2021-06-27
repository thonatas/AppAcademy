//
//  CandidateTableViewCell.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit
import SnapKit

class CandidateTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "q.square")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addCourseImageView()
        addNameLabel()
        addAgeLabel()
        addStateLabel()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Constraints
private extension CandidateTableViewCell {
    
    func addCourseImageView() {
        contentView.addSubview(courseImageView)
        
        courseImageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(15)
            make.width.equalTo(75)
            make.height.equalTo(50)
        }
    }
    
    func addNameLabel() {
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(courseImageView.snp.trailing).offset(5)
        }
    }
    
    func addAgeLabel() {
        contentView.addSubview(ageLabel)
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(nameLabel.snp.trailing).offset(5)
            make.trailing.equalTo(contentView)
            make.width.equalTo(100)
        }
    }
    
    func addStateLabel() {
        contentView.addSubview(stateLabel)
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(5)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(nameLabel.snp.trailing).offset(5)
            make.trailing.equalTo(contentView)
            make.width.equalTo(100)
        }
    }
}

extension CandidateTableViewCell {
    
    func configureCell(candidate: Candidate) {
        let course = candidate.course

        nameLabel.text = candidate.fullName
        ageLabel.text = candidate.ageString
        stateLabel.text = candidate.state
        
        switch course {
        case Course.iOS.rawValue:
            courseImageView.image = UIImage(systemName: "applelogo")
        case Course.android.rawValue:
            courseImageView.image = UIImage(named:"Android")?.withTintColor(.systemBlue, renderingMode: .automatic)
        case Course.qa.rawValue:
            courseImageView.image = UIImage(systemName: "q.square")
        default:
            break
        }
        
    }
}
