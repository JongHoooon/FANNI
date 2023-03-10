//
//  OSLog+Extension.swift
//  FANNI-iOS
//
//  Created by JongHoon on 2023/02/18.
//

import os.log
import Foundation

class Log {
    enum Level: String {
        case verbose = "đ VERBOSE"
        case debug = "â¨ DEBUG"
        case info = "âšī¸ INFO"
        case warning = "â ī¸ WARNING"
        case error = "đ¨ ERROR"
    }
    
    static private func log(_ message: Any, level: Level, filename: String, line: Int, funcName: String) {
    #if DEBUG
      
        let logMessage = "\(message)"
        let head = level.rawValue
        let filename = filename.components(separatedBy: "/").last
        
        print("\(Date().toString()) [\(head)][\(filename ?? ""), \(line), \(funcName)] - \(logMessage)")

    #endif
    }
}

extension Log {
    static func verbose(_ message: Any, filename: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .verbose, filename: filename, line: line, funcName: funcName)
    }
    
    static func debug(_ message: Any, filename: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .debug, filename: filename, line: line, funcName: funcName)
    }
    
    static func info(_ message: Any, filename: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .info, filename: filename, line: line, funcName: funcName)
    }
    
    static func warning(_ message: Any, filename: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .warning, filename: filename, line: line, funcName: funcName)
    }
    
    static func error(_ message: Any, filename: String = #fileID, line: Int = #line, funcName: String = #function) {
        log(message, level: .error, filename: filename, line: line, funcName: funcName)
    }
}
