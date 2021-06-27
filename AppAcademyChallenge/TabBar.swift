//
//  TabBar.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 14/06/21.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: ChallengesViewController(), title: NSLocalizedString("Desafios", comment: ""), image: UIImage(systemName: "flag")!),
            createNavController(for: InstructorsListViewController(), title: NSLocalizedString("Instrutores", comment: ""), image: UIImage(systemName: "person.crop.rectangle")!),
            createNavController(for: CandidatesListViewController(), title: NSLocalizedString("Candidatos", comment: ""), image: UIImage(systemName: "list.star")!),
            createNavController(for: PieChartViewController(), title: NSLocalizedString("Gráfico", comment: ""), image: UIImage(systemName: "chart.pie")!),
            createNavController(for: MapViewController(), title: NSLocalizedString("Mapa", comment: ""), image: UIImage(systemName: "map")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}
