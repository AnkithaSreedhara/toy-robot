//
//  Direction.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation
public enum Direction : String{
   case EAST = "EAST"
    case WEST = "WEST"
    case SOUTH = "SOUTH"
    case NORTH = "NORTH"
    var title:String{
        switch self {
            case .EAST: return "EAST"
            case .WEST: return "WEST"
            case .SOUTH: return "SOUTH"
            case .NORTH: return "NORTH"
        }
    }
}
