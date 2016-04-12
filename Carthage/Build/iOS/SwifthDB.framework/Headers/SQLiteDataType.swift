//
//  SQLiteDataType.swift
//  SwifthDB
//
//  Created by bob on 16/4/12.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation

public enum SQLiteDatatype: String {
    case Text       = "TEXT"
    case Integer    = "INTEGER"
    case Real       = "REAL"
    case Blob       = "BLOB"
    case Numeric    = "NUMERIC"
    case Null       = "NULL"
    
    init?(type: Value.Type) {
        switch type {
        case is Int.Type, is Int8.Type, is Int16.Type, is Int32.Type, is Int64.Type, is UInt.Type, is UInt8.Type, is UInt16.Type, is UInt32.Type, is UInt64.Type, is Bool.Type:
            self.init(rawValue: "INTEGER")
        case is Double.Type, is Float.Type, is NSDate.Type:
            self.init(rawValue: "REAL")
        case is NSData.Type:
            self.init(rawValue: "BLOB")
        case is NSNumber.Type:
            self.init(rawValue: "NUMERIC")
        case is String.Type, is NSString.Type, is Character.Type:
            self.init(rawValue: "TEXT")
        case is NSArray.Type, is NSDictionary.Type:
            self.init(rawValue: "BLOB")
        default:
            fatalError("DSADSASA")
        }
    }
}