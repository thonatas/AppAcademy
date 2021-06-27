//
//  Instructor.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 15/06/21.
//

import UIKit

class InstructorView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    func setup(with instructorCourse: Course, instructor: Candidate) {
        
        addImageView()
        addDescriptionLabel()
        addNameLabel()
        
        switch instructorCourse {
        case .iOS:
            self.backgroundColor = Colors.ios
        case .android:
            self.backgroundColor = Colors.android
        default:
            self.backgroundColor = .white
        }
        
        self.imageView.image = UIImage(named: instructorCourse.rawValue)
        self.descriptionLabel.text = "Instrutor \(instructorCourse.rawValue):"
        self.nameLabel.text = instructor.fullName
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension InstructorView {
    func addImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 125),
            imageView.widthAnchor.constraint(equalToConstant: 125)
            
        ])
    }
    
    func addDescriptionLabel() {
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
    func addNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
}
