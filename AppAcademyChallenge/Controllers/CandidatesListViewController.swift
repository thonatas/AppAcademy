//
//  CandidatesListViewController.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit

class CandidatesListViewController: UITableViewController {
    
    var candidateManager = CandidateManager()
    var candidates = [Candidate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateManager.parseToCsv()
        candidates = candidateManager.candidates
        
        tableView.register(CandidateTableViewCell.self, forCellReuseIdentifier: "candidateCell")
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(buttonSaveTapped))
        
    }
    
}

// MARK: - TableView Delegate/Data Source
extension CandidatesListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "candidateCell", for: indexPath) as! CandidateTableViewCell
        let candidate = candidates[indexPath.row]
        cell.configureCell(candidate: candidate)
        
        return cell
    }
}

// MARK: - Button Functions
extension CandidatesListViewController {
    @objc func buttonSaveTapped() {
        
        candidateManager.exportToCsv()
        
        let fileName = "Sorted_AppAcademy_Candidates.csv"
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let path = documentDirectory.appendingPathComponent(fileName)

        var shareItems = [Any]()
        shareItems.append(path)
        
        let avController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(avController, animated: true, completion: nil)
        
    }
}
