import ceylon.test {
    assertEquals,
    assertFalse,
    assertNull,
    assertTrue,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

test
shared void testDefineInner() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    innerContext[key] = val;
    
    assertTrue(innerContext.defines(key), "Inner context should define the key after inner put");
    assertFalse(outerContext.defines(key), "Outer context should not have changed after inner put");
}

test
shared void testDefineOuter() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    outerContext[key] = val;
    
    assertTrue(innerContext.defines(key), "Inner context should define the key after outer put");
    assertTrue(outerContext.defines(key), "Outer context should define the key after outer put");
}

test
shared void testGetInner() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    innerContext[key] = val;
    
    assertEquals(innerContext[key], val, "Inner context should return the value after inner put");
    assertNull(outerContext[key], "Outer context should not have changes after inner put");
}

test
shared void testGetOuter() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    outerContext[key] = val;
    
    assertEquals(innerContext[key], val, "Inner context should return the value after outer put");
    assertEquals(outerContext[key], val, "Outer context should return the value after outer put");
}
