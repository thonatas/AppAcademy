//
//  CandidateTableViewCell.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
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
        
        NSLayoutConstraint.activate([
            courseImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            courseImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            courseImageView.widthAnchor.constraint(equalToConstant: 75),
            courseImageView.heightAnchor.constraint(equalToConstant: 50),
            courseImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
    }
    
    func addNameLabel() {
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: courseImageView.trailingAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func addAgeLabel() {
        contentView.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            ageLabel.widthAnchor.constraint(equalToConstant: 100),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    func addStateLabel() {
        contentView.addSubview(stateLabel)
        
        NSLayoutConstraint.activate([
            stateLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5),
            stateLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            stateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stateLabel.widthAnchor.constraint(equalToConstant: 100),
            stateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
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
