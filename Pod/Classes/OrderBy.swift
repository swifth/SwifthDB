//
//  Filter.swift
//  SwiftyDB
//
//  Created by Øyvind Grimnes on 17/01/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import TinySQLite

/** 
An instance of the Filter class is used to filter query results
All filters are automatically converted into SQLite statements when querying the database.
 
To make filtering easier, and backwards compatibility, it is possible to instantiate a filter object as a dictionary literal

**Example:**
 
Return any objects with the name 'Ghost'
 
```
let filter: Filter = ["name": "Ghost"]

let filter = Filter.equal("name", value: "Ghost")
```
*/

public enum OrderDirection: String {
    case Asc =            "asc"
    case Desc =             "desc"
}

struct OrderTuple {
    let filedName : String
    let orderDirection : OrderDirection
    
    func statement() -> String {
        switch orderDirection {
        case .Asc:
            return "\(filedName) \(orderDirection.rawValue)"
        case .Desc:
            return "\(filedName) \(orderDirection.rawValue)"
        }
    }
}

public class OrderBy {
    
    private var orderFileds: [OrderTuple] = []
    
   
    /** Initialize a new, empty Filter object */
    public init() {}
    
    
    public func appendOrderBy(filedName: String, direction: OrderDirection) -> OrderBy {
        let ot = OrderTuple(filedName: filedName, orderDirection: direction)
        orderFileds.append(ot)
        return self
    }
    
    
    func statement() -> String {
        let statement = "orderby " + self.orderFileds.map {$0.statement()}.joinWithSeparator(" , ")
        return statement
    }
    
}

