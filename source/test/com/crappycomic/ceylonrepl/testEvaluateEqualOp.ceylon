import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Boolean]*} testEvaluateEqualOpParameters = {
    ["1 == 1", true],
    ["1 == 2", false],
    ["1.0 == 1.0", true],
    ["1.0 == 2.0", false],
    ["\"hello\" == \"hello\"", true],
    ["\"hello\" == \"goodbye\"", false]
};

test
parameters(`value testEvaluateEqualOpParameters`)
void testEvaluateEqualOp(String code, Boolean expected) {
    assertEquals(testEvaluate(code), expected);
}
