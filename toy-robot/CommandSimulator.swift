//
//  CommandSimulator.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation
class CommandSimulator{
    private var commands : [String] = [String]()
    func getCommands() -> [String]{
        return self.commands
    }
    func setCommands(commands: [String]){
        self.commands = commands
    }
    func addCommand(command: String){
        self.commands.append(command)
    }
    init() {
        commands = [String]()
    }
}
