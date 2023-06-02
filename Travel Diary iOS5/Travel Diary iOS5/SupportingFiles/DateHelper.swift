//
//  DateHelper.swift
//  Travel Diary iOS5
//
//  Created by Milo Kvarfordt on 6/1/23.
//

import Foundation

extension Date {
    
    func asString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
