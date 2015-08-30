//
//  Created by Daniel Thorpe on 08/04/2015.
//

import YapDatabase
import BrightFutures


extension YapDatabaseConnection {

    public func asyncRead<Object where Object: Persistable>(key: String) -> Future<Object?> {
        let promise = Promise<Object?>()
        asyncRead(key, completion: promise.success)
        return promise.future
    }

    public func asyncRead<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(key: String) -> Future<Value?> {
        let promise = Promise<Value?>()
        asyncRead(key, completion: promise.success)
        return promise.future
    }
}

extension YapDatabaseConnection {

    public func asyncRead<Object where Object: Persistable>(keys: [String]) -> Future<[Object]> {
        let promise = Promise<[Object]>()
        asyncRead(keys, completion: promise.success)
        return promise.future
    }

    public func asyncRead<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(keys: [String]) -> Future<[Value]> {
        let promise = Promise<[Value]>()
        asyncRead(keys, completion: promise.success)
        return promise.future
    }
}

extension YapDatabaseConnection {

    /**
    Asynchonously writes a Persistable object conforming to NSCoding to the database using the connection.

    :param: object An Object.
    :return: a Future Object.
    */
    public func asyncWrite<Object where Object: NSCoding, Object: Persistable>(object: Object) -> Future<Object> {
        let promise = Promise<Object>()
        asyncWrite(object, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable object with metadata, both conforming to NSCoding to the database inside the read write transaction.

    :param: object An ObjectWithObjectMetadata.
    :return: a Future ObjectWithObjectMetadata.
    */
    public func asyncWrite<ObjectWithObjectMetadata where ObjectWithObjectMetadata: NSCoding, ObjectWithObjectMetadata: ObjectMetadataPersistable>(object: ObjectWithObjectMetadata) -> Future<ObjectWithObjectMetadata> {
        let promise = Promise<ObjectWithObjectMetadata>()
        asyncWrite(object, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable object, conforming to NSCoding, with metadata value type to the database inside the read write transaction.

    :param: object An ObjectWithValueMetadata.
    :return: a Future ObjectWithValueMetadata.
    */
    public func asyncWrite<ObjectWithValueMetadata where ObjectWithValueMetadata: NSCoding, ObjectWithValueMetadata: ValueMetadataPersistable>(object: ObjectWithValueMetadata) -> Future<ObjectWithValueMetadata> {
        let promise = Promise<ObjectWithValueMetadata>()
        asyncWrite(object, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable value conforming to Saveable to the database inside the read write transaction.

    :param: value A Value.
    :return: a Future Value.
    */
    public func asyncWrite<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(value: Value) -> Future<Value> {
        let promise = Promise<Value>()
        asyncWrite(value, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable value, conforming to Saveable with a metadata object conforming to NSCoding, to the database inside the read write transaction.

    :param: value A ValueWithObjectMetadata.
    :return: a Future ValueWithObjectMetadata.
    */
    public func asyncWrite<ValueWithObjectMetadata where ValueWithObjectMetadata: Saveable, ValueWithObjectMetadata: ObjectMetadataPersistable, ValueWithObjectMetadata.ArchiverType.ValueType == ValueWithObjectMetadata>(value: ValueWithObjectMetadata) -> Future<ValueWithObjectMetadata> {
        let promise = Promise<ValueWithObjectMetadata>()
        asyncWrite(value, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable value with a metadata value, both conforming to Saveable, to the database inside the read write transaction.

    :param: value A ValueWithValueMetadata.
    :return: a Future ValueWithValueMetadata.
    */
    public func asyncWrite<ValueWithValueMetadata where ValueWithValueMetadata: Saveable, ValueWithValueMetadata: ValueMetadataPersistable, ValueWithValueMetadata.ArchiverType.ValueType == ValueWithValueMetadata, ValueWithValueMetadata.MetadataType.ArchiverType.ValueType == ValueWithValueMetadata.MetadataType>(value: ValueWithValueMetadata) -> Future<ValueWithValueMetadata> {
        let promise = Promise<ValueWithValueMetadata>()
        asyncWrite(value, completion: promise.success)
        return promise.future
    }
}

extension YapDatabaseConnection {

    /**
    Asynchonously writes Persistable objects conforming to NSCoding to the database using the connection.

    :param: objects A SequenceType of Object instances.
    :return: a Future array of Object instances.
    */
    public func asyncWrite<Objects, Object where Objects: SequenceType, Objects.Generator.Element == Object, Object: NSCoding, Object: Persistable>(objects: Objects) -> Future<[Object]> {
        let promise = Promise<[Object]>()
        asyncWrite(objects, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a sequence of Persistable object with metadata, both conforming to NSCoding to the database inside the read write transaction.

    :param: objects A SequenceType of ObjectWithObjectMetadata instances.
    :returns: a Future array of ObjectWithObjectMetadata instances.
    */
    public func asyncWrite<Objects, ObjectWithObjectMetadata where Objects: SequenceType, Objects.Generator.Element == ObjectWithObjectMetadata, ObjectWithObjectMetadata: NSCoding, ObjectWithObjectMetadata: ObjectMetadataPersistable>(objects: Objects) -> Future<[ObjectWithObjectMetadata]> {
        let promise = Promise<[ObjectWithObjectMetadata]>()
        asyncWrite(objects, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a sequence of Persistable object, conforming to NSCoding, with metadata value type to the database inside the read write transaction.

    :param: objects A SequenceType of ObjectWithValueMetadata instances.
    :returns: a Future array of ObjectWithValueMetadata instances.
    */
    public func asyncWrite<Objects, ObjectWithValueMetadata where Objects: SequenceType, Objects.Generator.Element == ObjectWithValueMetadata, ObjectWithValueMetadata: NSCoding, ObjectWithValueMetadata: ValueMetadataPersistable>(objects: Objects) -> Future<[ObjectWithValueMetadata]> {
        let promise = Promise<[ObjectWithValueMetadata]>()
        asyncWrite(objects, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes Persistable values conforming to Saveable to the database using the connection.

    :param: values A SequenceType of Value instances.
    :return: a Future array of Value instances.
    */
    public func asyncWrite<Values, Value where Values: SequenceType, Values.Generator.Element == Value, Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(values: Values) -> Future<[Value]> {
        let promise = Promise<[Value]>()
        asyncWrite(values, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a sequence of Persistable value, conforming to Saveable with a metadata object conforming to NSCoding, to the database inside the read write transaction.

    :param: values A SequenceType of ValueWithObjectMetadata instances.
    :returns: a Future array of ValueWithObjectMetadata instances.
    */
    public func asyncWrite<Values, ValueWithObjectMetadata where Values: SequenceType, Values.Generator.Element == ValueWithObjectMetadata, ValueWithObjectMetadata: Saveable, ValueWithObjectMetadata: ObjectMetadataPersistable, ValueWithObjectMetadata.ArchiverType.ValueType == ValueWithObjectMetadata>(values: Values) -> Future<[ValueWithObjectMetadata]> {
        let promise = Promise<[ValueWithObjectMetadata]>()
        asyncWrite(values, completion: promise.success)
        return promise.future

    }

    /**
    Asynchonously writes a sequence of Persistable value with a metadata value, both conforming to Saveable, to the database inside the read write transaction.

    :param: values A SequenceType of ValueWithValueMetadata instances.
    :returns: a Future array of ValueWithValueMetadata instances.
    */
    public func asyncWrite<Values, ValueWithValueMetadata where Values: SequenceType, Values.Generator.Element == ValueWithValueMetadata, ValueWithValueMetadata: Saveable, ValueWithValueMetadata: ValueMetadataPersistable, ValueWithValueMetadata.ArchiverType.ValueType == ValueWithValueMetadata>(values: Values) -> Future<[ValueWithValueMetadata]> {
        let promise = Promise<[ValueWithValueMetadata]>()
        asyncWrite(values, completion: promise.success)
        return promise.future
    }
}

extension YapDatabaseConnection {

    public func asyncRemove<Item where Item: Persistable>(item: Item) -> Future<Void> {
        let promise = Promise<Void>()
        asyncRemove(item, completion: promise.success)
        return promise.future
    }
}

extension YapDatabaseConnection {

    public func asyncRemove<Items where Items: SequenceType, Items.Generator.Element: Persistable>(items: Items) -> Future<Void> {
        let promise = Promise<Void>()
        asyncRemove(items, completion: promise.success)
        return promise.future
    }
}





// MARK: - YapDatabase

extension YapDatabase {

    public func asyncRead<Object where Object: Persistable>(key: String) -> Future<Object?> {
        let promise = Promise<Object?>()
        asyncRead(key, completion: promise.success)
        return promise.future
    }

    public func asyncRead<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(key: String) -> Future<Value?> {
        let promise = Promise<Value?>()
        asyncRead(key, completion: promise.success)
        return promise.future
    }
}

extension YapDatabase {

    public func asyncRead<Object where Object: Persistable>(keys: [String]) -> Future<[Object]> {
        let promise = Promise<[Object]>()
        asyncRead(keys, completion: promise.success)
        return promise.future
    }

    public func asyncRead<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(keys: [String]) -> Future<[Value]> {
        let promise = Promise<[Value]>()
        asyncRead(keys, completion: promise.success)
        return promise.future
    }
}

extension YapDatabase {

    /**
    Asynchonously writes a Persistable object conforming to NSCoding to the database using a new connection.

    :param: object An Object.
    :return: a Future Object.
    */
    public func asyncWrite<Object where Object: NSCoding, Object: Persistable>(object: Object) -> Future<Object> {
        let promise = Promise<Object>()
        asyncWrite(object, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable object with metadata, both conforming to NSCoding to the database using a new connection.

    :param: object An ObjectWithObjectMetadata.
    :return: a Future ObjectWithObjectMetadata.
    */
    public func asyncWrite<ObjectWithObjectMetadata where ObjectWithObjectMetadata: NSCoding, ObjectWithObjectMetadata: ObjectMetadataPersistable>(object: ObjectWithObjectMetadata) -> Future<ObjectWithObjectMetadata> {
        let promise = Promise<ObjectWithObjectMetadata>()
        asyncWrite(object, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable object, conforming to NSCoding, with metadata value type to the database using a new connection.

    :param: object An ObjectWithValueMetadata.
    :return: a Future ObjectWithValueMetadata.
    */
    public func asyncWrite<ObjectWithValueMetadata where ObjectWithValueMetadata: NSCoding, ObjectWithValueMetadata: ValueMetadataPersistable>(object: ObjectWithValueMetadata) -> Future<ObjectWithValueMetadata> {
        let promise = Promise<ObjectWithValueMetadata>()
        asyncWrite(object, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable value conforming to Saveable to the database using a new connection.

    :param: value A Value.
    :return: a Future Value.
    */
    public func asyncWrite<Value where Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(value: Value) -> Future<Value> {
        let promise = Promise<Value>()
        asyncWrite(value, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable value, conforming to Saveable with a metadata object conforming to NSCoding, to the database using a new connection.

    :param: value A ValueWithObjectMetadata.
    :return: a Future ValueWithObjectMetadata.
    */
    public func asyncWrite<ValueWithObjectMetadata where ValueWithObjectMetadata: Saveable, ValueWithObjectMetadata: ObjectMetadataPersistable, ValueWithObjectMetadata.ArchiverType.ValueType == ValueWithObjectMetadata>(value: ValueWithObjectMetadata) -> Future<ValueWithObjectMetadata> {
        let promise = Promise<ValueWithObjectMetadata>()
        asyncWrite(value, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a Persistable value with a metadata value, both conforming to Saveable, to the database using a new connection.

    :param: value A ValueWithValueMetadata.
    :return: a Future ValueWithValueMetadata.
    */
    public func asyncWrite<ValueWithValueMetadata where ValueWithValueMetadata: Saveable, ValueWithValueMetadata: ValueMetadataPersistable, ValueWithValueMetadata.ArchiverType.ValueType == ValueWithValueMetadata, ValueWithValueMetadata.MetadataType.ArchiverType.ValueType == ValueWithValueMetadata.MetadataType>(value: ValueWithValueMetadata) -> Future<ValueWithValueMetadata> {
        let promise = Promise<ValueWithValueMetadata>()
        asyncWrite(value, completion: promise.success)
        return promise.future
    }
}

extension YapDatabase {

    /**
    Asynchonously writes Persistable objects conforming to NSCoding to the database using a new connection.

    :param: objects A SequenceType of Object instances.
    :return: a Future array of Object instances.
    */
    public func asyncWrite<Objects, Object where Objects: SequenceType, Objects.Generator.Element == Object, Object: NSCoding, Object: Persistable>(objects: Objects) -> Future<[Object]> {
        let promise = Promise<[Object]>()
        asyncWrite(objects, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a sequence of Persistable object with metadata, both conforming to NSCoding to the database using a new connection.

    :param: objects A SequenceType of ObjectWithObjectMetadata instances.
    :returns: a Future array of ObjectWithObjectMetadata instances.
    */
    public func asyncWrite<Objects, ObjectWithObjectMetadata where Objects: SequenceType, Objects.Generator.Element == ObjectWithObjectMetadata, ObjectWithObjectMetadata: NSCoding, ObjectWithObjectMetadata: ObjectMetadataPersistable>(objects: Objects) -> Future<[ObjectWithObjectMetadata]> {
        let promise = Promise<[ObjectWithObjectMetadata]>()
        asyncWrite(objects, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a sequence of Persistable object, conforming to NSCoding, with metadata value type to the database using a new connection.

    :param: objects A SequenceType of ObjectWithValueMetadata instances.
    :returns: a Future array of ObjectWithValueMetadata instances.
    */
    public func asyncWrite<Objects, ObjectWithValueMetadata where Objects: SequenceType, Objects.Generator.Element == ObjectWithValueMetadata, ObjectWithValueMetadata: NSCoding, ObjectWithValueMetadata: ValueMetadataPersistable>(objects: Objects) -> Future<[ObjectWithValueMetadata]> {
        let promise = Promise<[ObjectWithValueMetadata]>()
        asyncWrite(objects, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes Persistable values conforming to Saveable to the database using a new connection.

    :param: values A SequenceType of Value instances.
    :return: a Future array of Value instances.
    */
    public func asyncWrite<Values, Value where Values: SequenceType, Values.Generator.Element == Value, Value: Saveable, Value: Persistable, Value.ArchiverType.ValueType == Value>(values: Values) -> Future<[Value]> {
        let promise = Promise<[Value]>()
        asyncWrite(values, completion: promise.success)
        return promise.future
    }

    /**
    Asynchonously writes a sequence of Persistable value, conforming to Saveable with a metadata object conforming to NSCoding, to the database using a new connection.

    :param: objects A SequenceType of ValueWithObjectMetadata instances.
    :returns: a Future array of ValueWithObjectMetadata instances.
    */
    public func asyncWrite<Values, ValueWithObjectMetadata where Values: SequenceType, Values.Generator.Element == ValueWithObjectMetadata, ValueWithObjectMetadata: Saveable, ValueWithObjectMetadata: ObjectMetadataPersistable, ValueWithObjectMetadata.ArchiverType.ValueType == ValueWithObjectMetadata>(values: Values) -> Future<[ValueWithObjectMetadata]> {
        let promise = Promise<[ValueWithObjectMetadata]>()
        asyncWrite(values, completion: promise.success)
        return promise.future

    }

    /**
    Asynchonously writes a sequence of Persistable value with a metadata value, both conforming to Saveable, to the database using a new connection.

    :param: objects A SequenceType of ValueWithValueMetadata instances.
    :returns: a Future array of ValueWithValueMetadata instances.
    */
    public func asyncWrite<Values, ValueWithValueMetadata where Values: SequenceType, Values.Generator.Element == ValueWithValueMetadata, ValueWithValueMetadata: Saveable, ValueWithValueMetadata: ValueMetadataPersistable, ValueWithValueMetadata.ArchiverType.ValueType == ValueWithValueMetadata>(values: Values) -> Future<[ValueWithValueMetadata]> {
        let promise = Promise<[ValueWithValueMetadata]>()
        asyncWrite(values, completion: promise.success)
        return promise.future
    }
}

extension YapDatabase {

    public func asyncRemove<Item where Item: Persistable>(item: Item) -> Future<Void> {
        let promise = Promise<Void>()
        asyncRemove(item, completion: promise.success)
        return promise.future
    }
}

extension YapDatabase {

    public func asyncRemove<Items where Items: SequenceType, Items.Generator.Element: Persistable>(items: Items) -> Future<Void> {
        let promise = Promise<Void>()
        asyncRemove(items, completion: promise.success)
        return promise.future
    }
}


