import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[Anything, Anything, Anything]*} testEvaluatePostfixIncrementOpParameters = {
    [0, 0, 1],
    [5, 5, 6]
    // TODO: characters, bytes, months
};

test
parameters (`value testEvaluatePostfixIncrementOpParameters`)
shared void testEvaluatePostfixIncrementOp(Anything initialVariableValue,
        Anything expectedExpressionValue, Anything expectedVariableValue) {
    value context = Context();
    value key = "a";
    
    context[key] = initialVariableValue;
    
    assertEquals(testEvaluate("``key``++", context), expectedExpressionValue);
    assertEquals(context[key], expectedVariableValue);
}

test
void testEvaluatePostfixIncrementOpInner() {
    value code = "variable value a = 0;
                  if (true) { a++; }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 1);
}
