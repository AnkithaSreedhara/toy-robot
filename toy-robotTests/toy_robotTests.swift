//
//  toy_robotTests.swift
//  toy-robotTests
//
//  Created by Anki on 07/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import XCTest
@testable import toy_robot

class toy_robotTests: XCTestCase {
    
    func testSimulationAsExpected(){
        let report : Report? = Report()
        report?.addReport(report: "0,3,EAST")
        
        let commands : CommandSimulator = CommandSimulator()
        commands.addCommand(command: "PLACE 3,3,EAST")
        commands.addCommand(command: "RIGHT")
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "RIGHT")
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "RIGHT")
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "RIGHT")
        commands.addCommand(command: "REPORT")
        XCTAssertEqual(executeSimulations(commands: commands), report!)
    }
    
    func testMissingRobot(){
        let report : Report? = Report()
        report?.addReport(report: "ROBOT MISSING")
        
        let commands : CommandSimulator = CommandSimulator()
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "REPORT")
        
        XCTAssertEqual(executeSimulations(commands: commands), report!)
    }
    func testFailingCommands(){
        let report : Report? = Report()
        report?.addReport(report: "0,0,SOUTH")
        
        let commands : CommandSimulator = CommandSimulator()
        commands.addCommand(command: "PLACE 0,0,SOUTH")
        commands.addCommand(command: "MOVE")
        commands.addCommand(command: "REPORT")
        
        XCTAssertEqual(executeSimulations(commands: commands), report!)
    }
    func executeSimulations(commands: CommandSimulator)-> Report{
        let simService = RobotSimulationService.init()
        return simService.startSimulation(simulation: commands)
    }
}

