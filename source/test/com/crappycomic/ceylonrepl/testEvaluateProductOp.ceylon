import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateProductOpParameters = {
    ["1 * 1", 1],
    ["2 * 3", 6],
    ["3 * -1", -3],
    ["1.0 * 2.0", 2.0],
    ["1.0 * -0.5", -0.5],
    ["1 * 2 * 3", 6]
};

test
parameters(`value testEvaluateProductOpParameters`)
shared void testEvaluateProductOp(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
