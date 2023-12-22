//
//  Helper+Extension.swift
//  A39Gestures
//
//  Created by Davit Natenadze on 22.12.23.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}
