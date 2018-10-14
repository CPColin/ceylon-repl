import ceylon.test {
    assertEquals,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

// TODO: type safety, immutability
// figure out if we should even allow "a = 1" to create "a"

test
shared void testEvaluateAssignOperationCreatesNewValue() {
    value context = Context();
    value key = "testKey";
    value val = "testValue";
    
    value result = testEvaluate("``key`` = \"``val``\"", context);
    
    assertEquals(result, val, "Expression should have the value of the assignment");
    assertEquals(context[key], val, "Context should have the assigned value");
}

test
shared void testEvaluateAssignOperationUpdatesExistingValue() {
    value context = Context();
    value key = "testKey";
    value initialValue = "initialValue";
    value finalValue = "finalValue";
    
    context[key] = initialValue;
    
    value result = testEvaluate("``key`` = \"``finalValue``\"", context);
    
    assertEquals(result, finalValue, "Expression should have the value of the assignment");
    assertEquals(context[key], finalValue, "Context should have the new value");
}
