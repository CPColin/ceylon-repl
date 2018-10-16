import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateRangeOpParameters = {
    ["1..4", 1..4],
    ["value a = 1; value b = 10; a..b;", 1..10],
    ["3..-2", 3..-2]
    // TODO, characters, bytes, months
};

test
parameters(`value testEvaluateRangeOpParameters`)
void testEvaluateRangeOp(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
