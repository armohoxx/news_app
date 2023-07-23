//
//  ErrorExtension.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 23/7/2566 BE.
//

import Foundation

extension Error {
    var errorCode:Int? {
        return (self as NSError).code
    }
}
