import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[Anything, Anything, Anything]*} testEvaluatePrefixDecrementOperationParameters = {
    [0, -1, -1],
    [5, 4, 4]
    // TODO: characters, bytes, months
};

test
parameters (`value testEvaluatePrefixDecrementOperationParameters`)
shared void testEvaluatePrefixDecrementOperation(Anything initialVariableValue,
        Anything expectedExpressionValue, Anything expectedVariableValue) {
    value context = Context();
    value key = "a";
    
    context[key] = initialVariableValue;
    
    assertEquals(testEvaluate("--``key``", context), expectedExpressionValue);
    assertEquals(context[key], expectedVariableValue);
}
