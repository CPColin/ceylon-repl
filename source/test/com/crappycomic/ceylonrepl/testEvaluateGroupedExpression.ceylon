import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateGroupedExpressionParameters = {
    ["(2)", 2],
    ["(1.0)", 1.0],
    ["(((\"hello\")))", "hello"]
};

test
parameters(`value testEvaluateGroupedExpressionParameters`)
shared void testEvaluateGroupedExpression(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
