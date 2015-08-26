//
//  Operations.swift
//  YapDatabaseExtensions
//
//  Created by Daniel Thorpe on 26/08/2015.
//  Copyright (c) 2015 Daniel Thorpe. All rights reserved.
//

import Foundation
import YapDatabase
import Operations

extension YapDatabaseConnection {

    public func write<Object where Object: NSCoding, Object: Persistable>(object: Object) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(object) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<ObjectWithObjectMetadata where ObjectWithObjectMetadata: NSCoding, ObjectWithObjectMetadata: ObjectMetadataPersistable>(object: ObjectWithObjectMetadata) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(object) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<ObjectWithValueMetadata where ObjectWithValueMetadata: NSCoding, ObjectWithValueMetadata: ValueMetadataPersistable>(object: ObjectWithValueMetadata) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(object) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(value: Value) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(value) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<ValueWithValueMetadata where ValueWithValueMetadata: Saveable, ValueWithValueMetadata: ValueMetadataPersistable, ValueWithValueMetadata.ArchiverType.ValueType == ValueWithValueMetadata, ValueWithValueMetadata.MetadataType.ArchiverType.ValueType == ValueWithValueMetadata.MetadataType>(value: ValueWithValueMetadata) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(value) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<ValueWithObjectMetadata where ValueWithObjectMetadata: Saveable, ValueWithObjectMetadata: ObjectMetadataPersistable, ValueWithObjectMetadata.ArchiverType.ValueType == ValueWithObjectMetadata>(value: ValueWithObjectMetadata) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(value) { saved in
                continueWithError(error: nil)
            }
        }
    }
}


extension YapDatabaseConnection {

    public func write<Objects, Object where Objects: SequenceType, Objects.Generator.Element == Object, Object: NSCoding, Object: Persistable>(objects: Objects) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(objects) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<Objects, ObjectWithObjectMetadata where Objects: SequenceType, Objects.Generator.Element == ObjectWithObjectMetadata, ObjectWithObjectMetadata: NSCoding, ObjectWithObjectMetadata: ObjectMetadataPersistable>(objects: Objects) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(objects) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<Objects, ObjectWithValueMetadata where Objects: SequenceType, Objects.Generator.Element == ObjectWithValueMetadata, ObjectWithValueMetadata: NSCoding, ObjectWithValueMetadata: ValueMetadataPersistable>(objects: Objects) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(objects) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<Values, Value where Values: SequenceType, Values.Generator.Element == Value, Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(values: Values) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(values) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<Values, ValueWithValueMetadata where Values: SequenceType, Values.Generator.Element == ValueWithValueMetadata, ValueWithValueMetadata: Saveable, ValueWithValueMetadata: ValueMetadataPersistable, ValueWithValueMetadata.ArchiverType.ValueType == ValueWithValueMetadata, ValueWithValueMetadata.MetadataType.ArchiverType.ValueType == ValueWithValueMetadata.MetadataType>(values: Values) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(values) { saved in
                continueWithError(error: nil)
            }
        }
    }

    public func write<Values, ValueWithObjectMetadata where Values: SequenceType, Values.Generator.Element == ValueWithObjectMetadata, ValueWithObjectMetadata: Saveable, ValueWithObjectMetadata: ObjectMetadataPersistable, ValueWithObjectMetadata.ArchiverType.ValueType == ValueWithObjectMetadata>(values: Values) -> NSOperation {
        return BlockOperation { (continueWithError: BlockOperation.ContinuationBlockType) in
            self.asyncWrite(values) { saved in
                continueWithError(error: nil)
            }
        }
    }

}







