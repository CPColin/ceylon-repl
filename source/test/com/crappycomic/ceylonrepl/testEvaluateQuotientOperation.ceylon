import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateQuotientOperationParameters = {
    ["1 / 1", 1],
    ["2 / 3", 0],
    ["3 / -1", -3],
    ["1.0 / 2.0", 0.5],
    ["1.0 / -0.5", -2.0],
    ["1.0 / 2.0 / 3.0", 1.0 / 2.0 / 3.0]
};

test
parameters(`value testEvaluateQuotientOperationParameters`)
shared void testEvaluateQuotientOperation(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
