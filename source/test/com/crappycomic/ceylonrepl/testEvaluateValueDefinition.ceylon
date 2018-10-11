import ceylon.test {
    assertEquals,
    assertNull,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Node
}
import com.crappycomic.ceylonrepl.evaluate {
    evaluate
}

{[String, String, Anything]*} testEvaluateValueDefinitionParameters = {
    ["value a = 1", "a", 1],
    ["value a = 1 + 2", "a", 3],
    ["value a => 1", "a", 1]
};

test
parameters(`value testEvaluateValueDefinitionParameters`)
void testEvaluateValueDefinition(String code, String name, Anything expected) {
    value context = Context();
    
    assertNull(testEvaluate(code, context));
    
    value val = context[name];
    
    if (is Node val) {
        assertEquals(evaluate(context, val), expected);
    } else {
        assertEquals(val, expected);
    }
}

test
shared void testEvaluateValueDefinitionUpdateEager() {
    value context = Context();
    
    testEvaluate("value a = 1", context);
    testEvaluate("value b = a", context);
    
    assertEquals(testEvaluate("a", context), 1);
    assertEquals(testEvaluate("b", context), 1);
    
    context["a"] = 2;
    
    assertEquals(testEvaluate("a", context), 2);
    assertEquals(testEvaluate("b", context), 1);
}

test
shared void testEvaluateValueDefinitionUpdateLazy() {
    value context = Context();
    
    testEvaluate("value a = 1", context);
    testEvaluate("value b => a", context);
    
    assertEquals(testEvaluate("a", context), 1);
    assertEquals(testEvaluate("b", context), 1);
    
    context["a"] = 2;
    
    assertEquals(testEvaluate("a", context), 2);
    assertEquals(testEvaluate("b", context), 2);
}
