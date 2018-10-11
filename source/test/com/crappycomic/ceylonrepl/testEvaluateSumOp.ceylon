import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateSumOpParameters = {
    ["1 + 1", 2],
    ["2 + 3", 5],
    ["3 + -1", 2],
    ["1.0 + 2.0", 3.0],
    ["1.0 + -0.5", 0.5],
    ["1 + 2 + 3", 6],
    ["\"hello\" + \" world\"", "hello world"]
};

test
parameters(`value testEvaluateSumOpParameters`)
shared void testEvaluateSumOp(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
