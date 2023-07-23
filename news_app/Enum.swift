//
//  Enum.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 23/7/2566 BE.
//

import Foundation

enum ErrorAPI: String {
    case ErrorCancelled = "cancelled"
    case ErrorExecute = "execute_database_fail"
}

enum ConstraintNewsPage: Int {
    case DefaultSizeCell
    case DefaultConstraintLeftRight
    
    var cgFloatValue: CGFloat {
        switch self {
        case .DefaultSizeCell: return 260
        case .DefaultConstraintLeftRight: return 30
        }
    }
}
