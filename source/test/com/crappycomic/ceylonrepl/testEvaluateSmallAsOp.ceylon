import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Boolean]*} testEvaluateSmallAsOpParameters = {
    ["1 <= 1", true],
    ["1 <= 2", true],
    ["2 <= 1", false],
    ["1.0 <= 1.0", true],
    ["1.0 <= 2.0", true],
    ["2.0 <= 1.0", false],
    ["\"hello\" <= \"hello\"", true],
    ["\"hello\" <= \"goodbye\"", false],
    ["\"goodbye\" <= \"hello\"", true]
};

test
parameters(`value testEvaluateSmallAsOpParameters`)
void testEvaluateSmallAsOp(String code, Boolean expected) {
    assertEquals(testEvaluate(code), expected);
}
