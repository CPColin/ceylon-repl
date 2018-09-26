import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[Anything, Anything, Anything]*} testEvaluatePrefixIncrementOperationParameters = {
    [0, 1, 1],
    [5, 6, 6]
    // TODO: characters, bytes, months
};

test
parameters (`value testEvaluatePrefixIncrementOperationParameters`)
shared void testEvaluatePrefixIncrementOperation(Anything initialVariableValue,
        Anything expectedExpressionValue, Anything expectedVariableValue) {
    value context = Context();
    value key = "a";
    
    context[key] = initialVariableValue;
    
    assertEquals(testEvaluate("++``key``", context), expectedExpressionValue);
    assertEquals(context[key], expectedVariableValue);
}
