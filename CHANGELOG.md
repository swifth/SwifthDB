#Change Log
All notable changes to this project will be documented in this file.
`SwiftyDB` adheres to [Semantic Versioning](http://semver.org/).


### [2.0](https://github.com/swifth/swifthdb/releases/tag/2.0) (04/12/2016)

#### Changes
* fork from SwiftyDB
* Support for Carthage
* Support for Query Result's sort
* Merge TinySQLite
* Fixed problem 'Cannot found module sqlite3'
* Fixed multiple SQLiteDatatype declaration bug
* Fixed other bugs

### [1.1.0](https://github.com/Oyvindkg/swiftydb/releases/tag/1.1.0) (03/31/2016)

#### Changes
* Support for storing NSArrays and NSDictionaries (thanks to @kingslay)
* Now using the new Value protocol instead of SQLiteValue
* Fixes bug related to filtering a property with multiple values

## [1.0.0](https://github.com/Oyvindkg/swiftydb/releases/tag/1.0.0) (01/19/2016)

#### Changes
* Added `lessOrEqual`, and `greaterOrEqual` filters to `Filter`
* New filter syntax for all database queries. `..matchingFilter: ..` instead of `..matchingFitlers: ..`


### [0.9.3](https://github.com/Oyvindkg/swiftydb/releases/tag/0.9.3) (01/19/2016)

#### Changes
* Removed unnecessarily complex query generator
* Performance boost using `TinySQLite ~> 0.3.0`
* `Filter` is no longer a `SequenceType`

### [0.9.2](https://github.com/Oyvindkg/swiftydb/releases/tag/0.9.2) (01/18/2016)

#### Changes
* Now using `TinySQLite ~> 0.2.0`


### [0.9.1](https://github.com/Oyvindkg/swiftydb/releases/tag/0.9.1) (01/18/2016)

#### Changes
* Added `Filter` section to index in README
* Updated features in README


### [0.9.0](https://github.com/Oyvindkg/swiftydb/releases/tag/0.9.0) (01/17/2016)

#### Added
* New `Filter` type used to filter queries

#### Changes
* Use the new `Filter` type to filter queries instead of a `Dictionary`
    * `Filter` conforms to `DictionaryLiteralConvertible`. Therefore it is still possible to define your filters as a `Dictionary`
* Updated query generation
* Delete query now binding values in SQLite


### [0.8.2](https://github.com/Oyvindkg/swiftydb/releases/tag/0.8.2) (01/16/2016)

#### Added
* New documentation generated by Jazzy
  * Located in the 'docs'


### [0.8.1](https://github.com/Oyvindkg/swiftydb/releases/tag/0.8.1) (01/15/2016)

#### Changes
* Removed support for `Float80`
  * It is not supported by iOS
* Query generator classes are internal


### [0.8.0](https://github.com/Oyvindkg/swiftydb/releases/tag/0.8.0) (01/15/2016)

#### Added
* New methods for asynchronous queries to the database
* New `Result` type

#### Changes
* Queries are no longer throwing
* All queries use the new `Result` type for callbacks and return types
  * Allows handling results for sync and async queries to be similar


## [0.7.2](https://github.com/Oyvindkg/swiftydb/releases/tag/0.7.2) (01/12/2016)
Initial release
 
