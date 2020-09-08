//
//  RobotSimulationService.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation

class RobotSimulationService {

    func startSimulation(simulation: CommandSimulator) -> Report{
        let robot : Robot = Robot()
        let report : Report = Report()
        for commandString in simulation.getCommands(){
            if let command = CommandGenerator.getCommand(commandString: commandString){
                    command.execute(robot: robot, report: report)
            }else{
                print("Wrong command: " + commandString)
            }
        }
        return report
    }
}
