//
//  Log.swift
//  Travel Diary iOS5
//
//  Created by Milo Kvarfordt on 6/1/23.
//

import Foundation

class Log {
    
    var logTitle: String
    var logAddress: String
    var logDate: Date
    var logBody: String
    let uuid: UUID
    
    init(logTitle: String, logAddress: String, logDate: Date = Date(), logBody: String, uuid: UUID = UUID()) {
        self.logTitle = logTitle
        self.logAddress = logAddress
        self.logDate = logDate
        self.logBody = logBody
        self.uuid = uuid
    }
    
}

// MARK: - Extensions
extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

//extension Log: Equatable {
//    static func == (lhs: Log, rhs: Log) -> Bool {
//        return lhs.logTitle == rhs.logTitle &&
//        lhs.logAddress == rhs.logAddress &&
//        lhs.logDate == rhs.logDate &&
//        lhs.logBody == rhs.logBody
//    }
//}
