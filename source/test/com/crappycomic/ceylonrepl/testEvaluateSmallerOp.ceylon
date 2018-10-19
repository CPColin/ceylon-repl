import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Boolean]*} testEvaluateSmallerOpParameters = {
    ["1 < 1", false],
    ["1 < 2", true],
    ["2 < 1", false],
    ["1.0 < 1.0", false],
    ["1.0 < 2.0", true],
    ["2.0 < 1.0", false],
    ["\"hello\" < \"hello\"", false],
    ["\"hello\" < \"goodbye\"", false],
    ["\"goodbye\" < \"hello\"", true]
};

test
parameters(`value testEvaluateSmallerOpParameters`)
void testEvaluateSmallerOp(String code, Boolean expected) {
    assertEquals(testEvaluate(code), expected);
}
