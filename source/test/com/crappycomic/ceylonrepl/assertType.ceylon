import ceylon.language.meta {
    type,
    typeLiteral
}
import ceylon.test {
    assertTrue
}

Type assertType<Type>(Anything val) given Type satisfies Object {
    assertTrue(val is Type,
        "Value is wrong type: expected ``typeLiteral<Type>()`` but was ``type(val)``");
    
    assert (is Type val);
    
    return val;
}
