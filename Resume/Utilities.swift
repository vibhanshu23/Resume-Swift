//
//  Utilities.swift
//  Resume
//
//  Created by Vibhanshu Jain on 8/13/23.
//

import Foundation

extension String {

    //Created to identify duplicate strings for ForEach
    var uniqueID: String {
        "\(self)-\(UUID())"
    }
}
