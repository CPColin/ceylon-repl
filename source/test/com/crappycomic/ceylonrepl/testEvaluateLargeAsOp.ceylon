import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Boolean]*} testEvaluateLargeAsOpParameters = {
    ["1 >= 1", true],
    ["1 >= 2", false],
    ["2 >= 1", true],
    ["1.0 >= 1.0", true],
    ["1.0 >= 2.0", false],
    ["2.0 >= 1.0", true],
    ["\"hello\" >= \"hello\"", true],
    ["\"hello\" >= \"goodbye\"", true],
    ["\"goodbye\" >= \"hello\"", false]
};

test
parameters(`value testEvaluateLargeAsOpParameters`)
void testEvaluateLargeAsOp(String code, Boolean expected) {
    assertEquals(testEvaluate(code), expected);
}
