import ceylon.test {
    assertEquals,
    assertNull,
    ignore,
    test
}

import com.crappycomic.ceylonrepl {
    Context,
    undefined
}

test
void testEvaluateBlock() {
    value input = "value a = 1;
                   value b = 2;
                   value c = a + b;
                   
                   b;";
    value context = Context();
    value result = testEvaluate(input, context);
    
    assertEquals(context["a"], 1);
    assertEquals(context["b"], 2);
    assertEquals(context["c"], 3);
    assertEquals(result, 2);
}

test
ignore // TODO: Need to find a useful nested structure to test here
void testEvaluateNestedBlock() {
    value input = "value a = 1;
                   { value b = 2; }";
    value context = Context();
    value result = testEvaluate(input, context);
    
    assertEquals(context["a"], 1);
    assertNull(context["b"]);
    assertEquals(result, undefined);
}

test
void testEvaluateEmptyBlock() {
    value code = "{}";
    value result = testEvaluate(code, Context());
    
    assertEquals(result, undefined);
}
