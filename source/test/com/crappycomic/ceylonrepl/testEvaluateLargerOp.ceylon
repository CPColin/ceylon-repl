import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Boolean]*} testEvaluateLargerOpParameters = {
    ["1 > 1", false],
    ["1 > 2", false],
    ["2 > 1", true],
    ["1.0 > 1.0", false],
    ["1.0 > 2.0", false],
    ["2.0 > 1.0", true],
    ["\"hello\" > \"hello\"", false],
    ["\"hello\" > \"goodbye\"", true],
    ["\"goodbye\" > \"hello\"", false]
};

test
parameters(`value testEvaluateLargerOpParameters`)
void testEvaluateLargerOp(String code, Boolean expected) {
    assertEquals(testEvaluate(code), expected);
}
