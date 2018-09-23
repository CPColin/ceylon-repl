import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[{<String->Anything>*}, String, Anything]*} testEvaluateBaseExpressionParameters = {
    [{"a"->1}, "a", 1],
    [{"a"->1}, "b", null],
    [{"a"->1, "b"->2}, "a + b", 3]
};

test
parameters(`value testEvaluateBaseExpressionParameters`)
void testEvaluateBaseExpression({<String->Anything>*} contextEntries, String code,
        Anything expected) {
    value context = Context();
    
    contextEntries.each((key -> item) => context[key] = item);
    
    assertEquals(testEvaluate(code, context), expected);
}
