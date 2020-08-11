//
//  main.swift
//  OrgchartGenerator
//
//  Created by Roy Dawson on 4/10/20.
//  Copyright © 2020 Lucid Software. All rights reserved.
//

import Foundation
import CodableCSV
import ArgumentParser

struct RandomOrgchartGenerator: ParsableCommand {
    @Argument(help: "The number of employees to enclode in the generated orgchart.")
    var targetEmployeeCount: Int = 50
    
    @Option(name: .shortAndLong, help: "A custom name for the file not including the extension")
    var name: String?
    
    func run() {
        // Generate random orgchart
        var employees = [Employee(id: 1, name: "Alfred", supervisorId: 1)]
        while employees.count < targetEmployeeCount {
            employees.append(Employee(id: employees.count + 1, name: "Alfred", supervisorId: employees[Int.random(in: 0..<employees.count)].id))
        }

        // Create encoder
        let encoder = CSVEncoder { conf in
            conf.headers = Employee.CodingKeys.allCases.map(\.rawValue)
        }
        
        // Save File
        let fileName: String
        if let name = name {
            fileName = "\(name).csv"
        } else {
            fileName = "Orgchart\(targetEmployeeCount).csv"
        }
        let savingFile = URL(fileURLWithPath: fileName, relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath))
        try! encoder.encode(employees, into: savingFile)
    }
}

RandomOrgchartGenerator.main()
