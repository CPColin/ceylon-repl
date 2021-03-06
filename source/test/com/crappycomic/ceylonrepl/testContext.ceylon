import ceylon.test {
    assertEquals,
    assertFalse,
    assertTrue,
    test
}

import com.crappycomic.ceylonrepl {
    Context,
    undefined
}


test
void testDefineInner() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    innerContext[key] = val;
    
    assertTrue(innerContext.defines(key), "Inner context should define the key after inner put");
    assertFalse(outerContext.defines(key), "Outer context should not have changed after inner put");
}

void testDefineOuter() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    outerContext[key] = val;
    
    assertFalse(innerContext.defines(key), "Inner context should not have changed after outer put");
    assertTrue(outerContext.defines(key), "Outer context should define the key after outer put");
}

test
void testGetInner() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    innerContext[key] = val;
    
    assertEquals(innerContext[key], val, "Inner context should return the value after inner put");
    assertEquals(outerContext[key], undefined,
        "Outer context should not have changed after inner put");
}

test
void testGetOuter() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    value key = "key";
    value val = "val";
    
    outerContext[key] = val;
    
    assertEquals(innerContext[key], undefined,
        "Inner context should not have changed after outer put");
    assertEquals(outerContext[key], val, "Outer context should return the value after outer put");
}

test
void testGetUndefined() {
    value context = Context();
    
    assertEquals(context["a"], undefined);
}

test
void testGetNull() {
    value context = Context();
    value key = "a";
    
    context[key] = null;
    
    assertEquals(context[key], null);
}
