//
//  Robot.swift
//  toy-robot
//
//  Created by Anki on 07/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation
class Robot{
    public static let MAX_POSITION = 4;
    public static let MIN_POSITION = 0;
    var xPosition : Int?
    var yPosition : Int?
    var direction : Direction?
    init() {
        self.xPosition = nil
        self.yPosition = nil
        self.direction = nil
    }
    init(xPosition: Int,yPosition: Int,direction: Direction) {
        self.xPosition = xPosition;
        self.yPosition = yPosition;
        self.direction = direction;
    }
    func isOnTable() -> Bool {
        return xPosition != nil && yPosition != nil && direction != nil
    }
    
    func getCurrentPosition() -> String{
        if let x = xPosition, let y = yPosition,let direction = direction{
        return "\(String(describing: x)),\(String(describing: y)),\(String(describing: direction))"
        }else{
            return ""
        }
    }
    func increaseXPosition(){
        if let xPosition = self.xPosition{
            self.xPosition! = xPosition + 1
        }
    }
    func increaseYPosition(){
        if let yPosition = self.yPosition{
            self.yPosition! = yPosition + 1
        }
    }
    func decreaseXPosition(){
           if let xPosition = self.xPosition{
               self.xPosition! = xPosition - 1
           }
       }
       func decreaseYPosition(){
           if let yPosition = self.yPosition{
               self.yPosition! = yPosition - 1
           }
       }
}
