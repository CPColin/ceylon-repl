import ceylon.test {
    assertEquals,
    assertNull,
    ignore,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}
import com.crappycomic.ceylonrepl.evaluate {
    undefined
}

test
void testEvaluateBlock() {
    value input = "value a = 1;
                   value b = 2;
                   value c = a + b;";
    value context = Context();
    value result = testEvaluate(input, context);
    
    assertEquals(context["a"], 1);
    assertEquals(context["b"], 2);
    assertEquals(context["c"], 3);
    assertEquals(result, undefined);
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
