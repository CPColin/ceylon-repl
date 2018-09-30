import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateInvocationParameters = {
    ["\"a\".repeat(5)", "aaaaa"],
    [""""hello".replace("hell", "heck")""", "hecko"],
    ["identical(true, true)", true],
    ["identical(false, true)", false],
    ["identity(123)", 123]
    //["smallest(3, 4)", 3] TODO: type parameters with upper bounds
};

test
parameters(`value testEvaluateInvocationParameters`)
void testEvaluateInvocation(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
