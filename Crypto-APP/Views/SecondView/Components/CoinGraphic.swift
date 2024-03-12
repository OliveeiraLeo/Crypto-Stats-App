// CoinGraphic.swift
// Crypto-APP
// Created by Leonardo Oliveira on 10/03/24.

import UIKit
import Charts
import DGCharts

class CoinGraphic: UIView {

    private lazy var graphicView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var sparklineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSparklineWithData(_ sparklineData: [Double]) {
        setupSparklineChart(dataPoints: sparklineData)
    }

    func setupSparklineWithCoinsInfo(_ coinInfo: CoinsInfo) {
        let sparklineData = coinInfo.sparklineIn7D.price
        setupSparklineChart(dataPoints: sparklineData)
    }

    private func setupView() {
        setHierarchy()
        setConstraints()
    }

    private func setHierarchy() {
        addSubview(graphicView)
        graphicView.addSubview(sparklineChartView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            graphicView.topAnchor.constraint(equalTo: topAnchor),
            graphicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            graphicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            graphicView.bottomAnchor.constraint(equalTo: bottomAnchor),

            sparklineChartView.topAnchor.constraint(equalTo: graphicView.topAnchor, constant: 5),
            sparklineChartView.leadingAnchor.constraint(equalTo: graphicView.leadingAnchor, constant: 5),
            sparklineChartView.trailingAnchor.constraint(equalTo: graphicView.trailingAnchor, constant: -5),
            sparklineChartView.bottomAnchor.constraint(equalTo: graphicView.bottomAnchor, constant: -5)
        ])
    }

    private func setupSparklineChart(dataPoints: [Double]) {
        var lineChartEntry = [ChartDataEntry]()

        for i in 0..<dataPoints.count {
            let value = ChartDataEntry(x: Double(i), y: dataPoints[i])
            lineChartEntry.append(value)
        }

        let lineDataSet = LineChartDataSet(entries: lineChartEntry, label: "")
        lineDataSet.colors = [NSUIColor.black]
        lineDataSet.drawValuesEnabled = false
        lineDataSet.drawCirclesEnabled = false

        let lineChartData = LineChartData(dataSet: lineDataSet)
        sparklineChartView.data = lineChartData
        sparklineChartView.isUserInteractionEnabled = false
        sparklineChartView.rightAxis.enabled = false

        let xAxis = sparklineChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawLabelsEnabled = false

        sparklineChartView.legend.enabled = false

        sparklineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
}
