import ceylon.test {
    assertEquals,
    parameters,
    test
}


{[String, Anything]*} testEvaluateQualifiedExpressionParameters = {
    ["\"hello\".size", 5],
    ["\"hello\".size.negated", -5]
};

test
parameters(`value testEvaluateQualifiedExpressionParameters`)
shared void testEvaluateQualifiedExpression(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
