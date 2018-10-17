import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[Anything, Anything, Anything]*} testEvaluateDecrementOpParameters = {
    [0, -1, -1],
    [5, 4, 4]
    // TODO: characters, bytes, months
};

test
parameters (`value testEvaluateDecrementOpParameters`)
shared void testEvaluateDecrementOp(Anything initialVariableValue,
        Anything expectedExpressionValue, Anything expectedVariableValue) {
    value context = Context();
    value key = "a";
    
    context[key] = initialVariableValue;
    
    assertEquals(testEvaluate("--``key``", context), expectedExpressionValue);
    assertEquals(context[key], expectedVariableValue);
}

test
void testEvaluateDecrementOpInner() {
    value code = "variable value a = 0;
                  if (true) { --a; }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], -1);
}
