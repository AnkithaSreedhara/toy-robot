//
//  CommandGenerator.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation

class CommandGenerator {
    
    private static let regularEX =
    "^(PLACE)\\s\\d+,\\d+,(NORTH|WEST|EAST|SOUTH)$"
    
    static func getCommand (commandString:String) -> Command?{
        if (commandString.range(of: CommandGenerator.self.regularEX,options: .regularExpression,range: nil,locale: nil) != nil){
            return PlaceCommand(commandString: commandString)
        } else if (commandString.contains(CommandType.LEFT.title)){
            return LeftCommand()
        } else if (commandString.contains(CommandType.RIGHT.title)){
            return RightCommand()
        } else if (commandString.contains(CommandType.REPORT.title)){
            return ReportCommand()
        } else if (commandString.contains(CommandType.MOVE.title)){
            return MoveCommand()
        }
        return nil
    }
}
