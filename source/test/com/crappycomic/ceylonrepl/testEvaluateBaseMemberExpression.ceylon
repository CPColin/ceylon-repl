import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context,
    undefined
}

{[{<String->Anything>*}, String, Anything]*} testEvaluateBaseMemberExpressionParameters = {
    [{"a"->1}, "a", 1],
    [{"a"->1}, "b", undefined],
    [{"a"->1, "b"->2}, "a + b", 3],
    [empty, "true", true],
    [empty, "false", false],
    [empty, "runtime", runtime]
};

test
parameters(`value testEvaluateBaseMemberExpressionParameters`)
void testEvaluateBaseMemberExpression({<String->Anything>*} contextEntries, String code,
        Anything expected) {
    value context = Context();
    
    contextEntries.each((key -> item) => context[key] = item);
    
    assertEquals(testEvaluate(code, context), expected);
}

test
void testEvaluateBaseMemberExpressionOuterInner() {
    value outerContext = Context();
    value innerContext = outerContext.inner;
    
    outerContext["a"] = 1;
    outerContext["b"] = 2;
    innerContext["a"] = 3;
    innerContext["c"] = 4;
    
    assertEquals(testEvaluate("a", outerContext), 1);
    assertEquals(testEvaluate("b", outerContext), 2);
    assertEquals(testEvaluate("c", outerContext), undefined);
    
    assertEquals(testEvaluate("a", innerContext), 3);
    assertEquals(testEvaluate("b", innerContext), 2);
    assertEquals(testEvaluate("c", innerContext), 4);
}
