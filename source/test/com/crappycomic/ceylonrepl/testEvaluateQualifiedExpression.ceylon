import ceylon.test {
    assertEquals,
    parameters,
    test
}


{[String, Anything]*} testEvaluateQualifiedExpressionParameters = {
    ["\"hello\".size", 5],
    ["\"hello\".size.negated", -5]
    //["runtime.type", runtime.type], TODO: ClassDeclaration not showing members for objects
};

test
parameters(`value testEvaluateQualifiedExpressionParameters`)
shared void testEvaluateQualifiedExpression(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
