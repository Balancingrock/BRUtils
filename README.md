# BRUtils
A collection of recurring definitions, types, extensions, functions etc.

# Description
These utilities are used by many other projects of Balancingrock.

# Version history

Note: Planned releases are for information only and subject to change without notice.

#### 1.0.0 (Planned)

- To accompany Swiftfire 1.0.0

#### 0.11.0 (Current)

- Swift 4 migration

#### 0.10.0

- Added crc32 calculation to Data

#### 0.9.0

- Added UnsafeRawPointer based typed extractions
- Added crc16 calculation to Data
- Added Endianness and Endianness support to RawBytes

#### 0.8.0

- Added the RawBytes protocol to allow easy encoding/decoding into a foundation Data object.

#### 0.7.0

- Clamped functions have been added to: Int, UInt, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64, and Float.

#### 0.6.0

- Added new file: TimeRelated.swift

- Added extensions:
	- Array
		- range: Returns the a range from startIndex to endIndex
		- clamp: Clamps ensures that the value of an index is not outside the range startIndex ... endIndex
	- timespec
		- init(TimeInterval)
	- timeval
		- init(TimeInterval)
	- TimeInterval
		- init(timespec)
		- init(timeval)

- Added new function:
	- public sleep(TimeInterval) -> TimeInterval // Allows sub-second resolution for the sleep.
	
#### 0.5.0

- Added time related utilities

#### 0.4.0

- Added Int extension with 'isEven', 'isUneven', 'isMultiple(of)'
- Added + operator for 'Result' types.

#### 0.3.0

- Removed unnecessary extensions
- Added GlobalFunctions

#### 0.2.0

- Moved KeyedCache to its own repo to tighten up the namespace.

#### 0.1.0

- Initial release.
