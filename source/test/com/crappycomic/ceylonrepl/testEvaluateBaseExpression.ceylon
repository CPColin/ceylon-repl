import ceylon.test {
    assertEquals,
    assertNull,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[{<String->Anything>*}, String, Anything]*} testEvaluateBaseExpressionParameters = {
    [{"a"->1}, "a", 1],
    [{"a"->1}, "b", null],
    [{"a"->1, "b"->2}, "a + b", 3],
    [empty, "true", true],
    [empty, "false", false],
    [empty, "runtime", runtime]
};

test
parameters(`value testEvaluateBaseExpressionParameters`)
void testEvaluateBaseExpression({<String->Anything>*} contextEntries, String code,
        Anything expected) {
    value context = Context();
    
    contextEntries.each((key -> item) => context[key] = item);
    
    assertEquals(testEvaluate(code, context), expected);
}

test
void testEvaluateBaseExpressionOuterInner() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    
    outerContext["a"] = 1;
    outerContext["b"] = 2;
    innerContext["a"] = 3;
    innerContext["c"] = 4;
    
    assertEquals(testEvaluate("a", outerContext), 1);
    assertEquals(testEvaluate("b", outerContext), 2);
    assertNull(testEvaluate("c", outerContext));
    
    assertEquals(testEvaluate("a", innerContext), 3);
    assertEquals(testEvaluate("b", innerContext), 2);
    assertEquals(testEvaluate("c", innerContext), 4);
}
