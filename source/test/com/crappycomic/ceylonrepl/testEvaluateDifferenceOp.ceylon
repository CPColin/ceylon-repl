import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateDifferenceOpParameters = {
    ["1 - 1", 0],
    ["2 - 3", -1],
    ["3 - -1", 4],
    ["1.0 - 2.0", -1.0],
    ["1.0 - -0.5", 1.5],
    ["5 - 2 - 1", 2],
    ["5 - (2 - 1)", 4]
};

test
parameters(`value testEvaluateDifferenceOpParameters`)
shared void testEvaluateDifferenceOp(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
