//
//  Commands.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation
protocol Command {
    func execute(robot:Robot,report:Report)
}
class PlaceCommand : Command{
    private var commandString : String?
    init(commandString:String) {
        self.commandString = commandString
    }
    func execute(robot:Robot,report:Report){
        
        guard let placement : String = commandString?.subStringAfterLastComma.trimmingCharacters(in: .whitespaces) else{ return }
        let commands : [String] = placement.components(separatedBy: ",")
        let initialXPosition = Int(commands[0]) ?? 0
        let initialYPosition = Int(commands[1]) ?? 0
        if(initialXPosition <= Robot.MAX_POSITION && initialXPosition >= Robot.MIN_POSITION &&
            initialYPosition <= Robot.MAX_POSITION && initialYPosition >= Robot.MIN_POSITION){
            robot.xPosition = initialXPosition
            robot.yPosition = initialYPosition
            robot.direction = Direction(rawValue: commands[2]) ?? Direction.NORTH
            print("Robot is placed at " + robot.getCurrentPosition())
        }else{
            print("Place command ignored")
        }
    }
}

