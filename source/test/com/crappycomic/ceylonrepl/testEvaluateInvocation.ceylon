import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateInvocationParameters = {
    ["\"a\".repeat(5)", "aaaaa"],
    [""""hello".replace("hell", "heck")""", "hecko"]
    //["smallest(3, 4)", 3] TODO: generics
};

test
parameters(`value testEvaluateInvocationParameters`)
void testEvaluateInvocation(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
