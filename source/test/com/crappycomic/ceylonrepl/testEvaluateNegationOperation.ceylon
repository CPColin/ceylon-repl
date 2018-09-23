import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateNegationOperationParameters = {
    ["-0", 0],
    ["-5", -5]
};

test
parameters(`value testEvaluateNegationOperationParameters`)
shared void testEvaluateNegationOperation(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
