//
//  QueryGenerator.swift
//  SwiftyDB
//
//  Created by Øyvind Grimnes on 27/12/15.
//

import Foundation


internal class StatementGenerator {
    
    internal class func createTableStatementForTypeRepresentedByObject <S: Storable> (object: S) -> String {
        let tableName =  tableNameForType(S)
        
        var statement = "CREATE TABLE " + tableName + " ("
        
        for propertyData in PropertyData.validPropertyDataForObject(object) {
            statement += "\(propertyData.name!) \(SQLiteDatatype(type: propertyData.type!)!.rawValue)"
            statement += propertyData.isOptional ? "" : " NOT NULL"
            statement += ", "
        }
        
        if S.self is PrimaryKeys.Type {
            let primaryKeysType = S.self as! PrimaryKeys.Type
            statement += "PRIMARY KEY (\(primaryKeysType.primaryKeys().joinWithSeparator(", ")))"
        }
        
        statement += ")"
        
        return statement
    }
    
    internal class func insertStatementForType(type: Storable.Type, update: Bool) -> String {
        var statement = "INSERT OR " + (update ? "REPLACE" : "ABORT") + " INTO " + tableNameForType(type)
        
        let propertyData = PropertyData.validPropertyDataForObject(type.init())
        
        let columns = propertyData.map {$0.name!}
        let namedParameters = columns.map {":" + $0}
        
        /* Columns to be inserted */
        statement += " (" + columns.joinWithSeparator(", ") + ") "
        
        /* Values to be inserted */
        statement += "VALUES (" + namedParameters.joinWithSeparator(", ") + ")"
        
        return statement
    }
    
    internal class func selectStatementForType(type: Storable.Type, matchingFilter filter: Filter?) -> String {
        
        let tableName =  tableNameForType(type)
        
        var statement = "SELECT ALL * FROM \(tableName)"
        
        guard filter != nil else {
            return statement
        }
        
        statement += " " + filter!.whereStatement()
        
        return statement
    }
    
    internal class func selectStatementForType(type: Storable.Type, matchingFilter filter: Filter?, orderBy: OrderBy?) -> String {
        
        let tableName =  tableNameForType(type)
        
        var statement = "SELECT ALL * FROM \(tableName)"
        
        guard filter != nil else {
            return statement
        }
        
        statement += " " + filter!.whereStatement()
        
        guard orderBy != nil else {
            return statement
        }
        
        statement += " " + orderBy!.statement()
        
        return statement
    }
    
    
    internal class func deleteStatementForType(type: Storable.Type, matchingFilter filter: Filter?) -> String {
        
        let tableName =  tableNameForType(type)
        
        var statement = "DELETE FROM \(tableName)"
        
        guard filter != nil else {
            return statement
        }
                
        statement += " \(filter!.whereStatement())"
        
        return statement
    }
    
    
    
    /** Name of the table representing a class */
    private class func tableNameForType(type: Storable.Type) -> String {
        return String(type)
    }
}