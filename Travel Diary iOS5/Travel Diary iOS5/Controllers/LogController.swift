//
//  LogController.swift
//  Travel Diary iOS5
//
//  Created by Milo Kvarfordt on 6/1/23.
//

import Foundation

class LogController {
    
    // MARK: - Properties
    static let sharedInstance = LogController()
    var logs: [Log] = []
    
    // MARK: - Functions CRUD
    func createLog(title: String, address: String, body: String) {
        let log = Log(logTitle: title, logAddress: address, logBody: body)
        logs.append(log)
    }
    
    func updateLog(log: Log, title: String, address: String, body: String) {
        log.logTitle = title
        log.logBody = body
        log.logAddress = address
        log.logDate = Date()
    }
    
    func delete(log: Log) {
        guard let index = logs.firstIndex(of: log) else { return }
        logs.remove(at: index)
    }
    
}
