//
//  PieChartViewController.swift
//  AppAcademyChallenge
//
//  Created by Thonatas Borges on 20/05/21.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {

    var pieChart: PieChartView?
    
    var candidateManager = CandidateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateManager.parseToCsv()
        updateChartData()
      }

    func updateChartData()  {
        let percentageIos = candidateManager.percentageCandidates(by: .iOS)
        let percentageAndroid = candidateManager.percentageCandidates(by: .android)
        let percentageQa = candidateManager.percentageCandidates(by: .qa)
        
        let chart = PieChartView(frame: self.view.frame)
        // 2. generate chart data entries
        let courses = ["iOS", "Android", "QA"]
        let percentage = [percentageIos, percentageAndroid, percentageQa]

        var entries = [PieChartDataEntry]()
        for (index, value) in percentage.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = courses[index]
            entries.append( entry)
        }

        let set = PieChartDataSet(entries: entries, label: "")
        let colors: [UIColor] = [Colors.ios, Colors.android, Colors.qa]

        set.colors = colors
        let data = PieChartData(dataSet: set)
        chart.data = data
        chart.noDataText = "% Candidatos por Curso"
        chart.isUserInteractionEnabled = true
        chart.animate(xAxisDuration: 1.0)

        let d = Description()
        d.text = "x"
        chart.chartDescription = d
        chart.centerText = "%perc"
        chart.holeRadiusPercent = 0.4
        chart.transparentCircleColor = UIColor.clear
        self.view.addSubview(chart)

    }

}
