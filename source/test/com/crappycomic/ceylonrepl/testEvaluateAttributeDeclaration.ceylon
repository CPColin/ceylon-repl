import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}
import com.crappycomic.ceylonrepl.evaluate {
    evaluate,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Node
}

{[String, String, Anything]*} testEvaluateAttributeDeclarationParameters = {
    ["value a = 1", "a", 1],
    ["value a = 1 + 2", "a", 3],
    ["value a => 1", "a", 1]
};

test
parameters(`value testEvaluateAttributeDeclarationParameters`)
void testEvaluateAttributeDeclaration(String code, String name, Anything expected) {
    value context = Context();
    
    assertEquals(testEvaluate(code, context), undefined);
    
    value val = context[name];
    
    if (is Node val) {
        assertEquals(evaluate(context, val), expected);
    } else {
        assertEquals(val, expected);
    }
}

test
shared void testEvaluateAttributeDeclarationUpdateEager() {
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
shared void testEvaluateAttributeDeclarationUpdateLazy() {
    value context = Context();
    
    testEvaluate("value a = 1", context);
    testEvaluate("value b => a", context);
    
    assertEquals(testEvaluate("a", context), 1);
    assertEquals(testEvaluate("b", context), 1);
    
    context["a"] = 2;
    
    assertEquals(testEvaluate("a", context), 2);
    assertEquals(testEvaluate("b", context), 2);
}
