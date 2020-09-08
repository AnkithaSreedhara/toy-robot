//
//  Report.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation
class Report: Equatable{
    private var reports : [String]
    func addReport(report:String){
        self.reports.append(report)
    }
    init() {
        reports = []
    }
    static func == (lhs: Report, rhs: Report) -> Bool {
        return lhs.reports.containsSameElements(as: rhs.reports)
    }
}
