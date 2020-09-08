//
//  CommandType.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation
public enum CommandType :String{
    case PLACE, MOVE, LEFT, RIGHT, REPORT
    var title:String{
        switch self {
        case .PLACE: return "PLACE"
        case .MOVE: return "MOVE"
        case .LEFT: return "LEFT"
        case .RIGHT: return "RIGHT"
        case .REPORT: return "REPORT"
        }
    }
}
class LeftCommand: Command{
    
    func execute( robot: Robot,  report: Report) {
        
        if (!robot.isOnTable()) {
            print("Left command ignored")
        } else {
            switch (robot.direction) {
            case .NORTH:
                robot.direction = .WEST
                break;
            case .SOUTH:
                robot.direction = .EAST
                break;
            case .EAST:
                robot.direction = .NORTH
                break;
            case .WEST:
                robot.direction = .SOUTH
                break;
            case .none:
                robot.direction = .EAST
            }
            print("The robot is rotating 90 degree to " + robot.direction!.title)
        }
        
    }
    
}
class RightCommand: Command{
    
    func execute( robot: Robot,  report: Report) {
        
        if (!robot.isOnTable()) {
            print("Right command ignored")
        } else {
            switch (robot.direction) {
            case .NORTH:
                robot.direction = .EAST
                break;
            case .SOUTH:
                robot.direction = .WEST
                break;
            case .EAST:
                robot.direction = .SOUTH
                break;
            case .WEST:
                robot.direction = .NORTH
                break;
            case .none:
                robot.direction = .WEST
            }
            print("The robot is rotating 90 degree to " + robot.direction!.title)
        }
        
    }
    
}
class MoveCommand: Command{
    func execute( robot: Robot,  report: Report) {
        guard let xPosition = robot.xPosition else{ return }
        guard let yPosition = robot.yPosition else{ return }
        if (!robot.isOnTable()) {
            print("Move command ignored")
        } else {
            switch (robot.direction) {
            case .NORTH:
                if (yPosition < Robot.MAX_POSITION){
                    robot.increaseYPosition()
                    print("The robot is moving")
                }else{
                    print("Move command ignored")
                }
                break;
                
            case .SOUTH:
                if (yPosition > Robot.MIN_POSITION) {
                    robot.decreaseYPosition();
                    print("The robot is moving")
                } else {
                    print("Move command ignored")
                }
                break;
                
            case .EAST:
                if (xPosition < Robot.MAX_POSITION) {
                    robot.increaseXPosition();
                    print("The robot is moving")
                } else {
                    print("Move command ignored")
                }
                break;
                
            case .WEST:
                if (xPosition > Robot.MIN_POSITION) {
                    robot.decreaseXPosition();
                    print("The robot is moving")
                } else {
                    print("Move command ignored")
                }
                break;
            case .none:
                print("Move command ignored")
                break;
            }
            
        }
    }
    
}
class ReportCommand: Command{
    func execute( robot: Robot,  report: Report) {
           if (!robot.isOnTable()) {
               print("Move command ignored")
            report.addReport(report: "ROBOT MISSING")
           } else {
            report.addReport(report: robot.getCurrentPosition())
        }
        }
}
