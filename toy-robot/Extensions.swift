//
//  Extensions.swift
//  toy-robot
//
//  Created by Anki on 08/09/20.
//  Copyright © 2020 ankitha. All rights reserved.
//

import Foundation

extension String {
    var subStringAfterLastComma : String {
        guard let subrange = self.range(of: CommandType.PLACE.title, options: [.regularExpression, .backwards]) else { return self }
        return String(self[subrange.upperBound...])
    }
}
extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
