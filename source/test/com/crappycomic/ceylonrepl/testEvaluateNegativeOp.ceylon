import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateNegativeOpParameters = {
    ["-0", 0],
    ["-5", -5],
    ["-4.5", -4.5]
};

test
parameters(`value testEvaluateNegativeOpParameters`)
shared void testEvaluateNegativeOp(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
