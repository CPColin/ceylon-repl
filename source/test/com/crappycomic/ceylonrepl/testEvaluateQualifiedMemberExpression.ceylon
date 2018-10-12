import ceylon.test {
    assertEquals,
    parameters,
    test
}


{[String, Anything]*} testEvaluateQualifiedMemberExpressionParameters = {
    ["\"hello\".size", 5],
    ["\"hello\".size.negated", -5]
    //["runtime.type", runtime.type], TODO: ClassDeclaration not showing members for objects
};

test
parameters(`value testEvaluateQualifiedMemberExpressionParameters`)
shared void testEvaluateQualifiedMemberExpression(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
