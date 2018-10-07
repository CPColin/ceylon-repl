import ceylon.test {
    assertEquals,
    assertNull,
    test
}

import com.crappycomic.ceylonrepl {
    Context
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
void testEvaluateNestedBlock() {
    value input = "value a = 1;
                   { value b = 2; }
                   a;";
    value context = Context();
    value result = testEvaluate(input, context);
    
    assertEquals(context["a"], 1);
    assertNull(context["b"]);
    assertEquals(result, 1);
}
