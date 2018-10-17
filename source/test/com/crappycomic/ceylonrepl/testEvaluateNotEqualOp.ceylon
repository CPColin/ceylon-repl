import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Boolean]*} testEvaluateNotEqualOpParameters = {
    ["1 != 1", false],
    ["1 != 2", true],
    ["1.0 != 1.0", false],
    ["1.0 != 2.0", true],
    ["\"hello\" != \"hello\"", false],
    ["\"hello\" != \"goodbye\"", true]
};

test
parameters(`value testEvaluateNotEqualOpParameters`)
void testEvaluateNotEqualOp(String code, Boolean expected) {
    assertEquals(testEvaluate(code), expected);
}
