import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Anything]*} testEvaluateSegmentOpParameters = {
    ["1:4", 1:4],
    ["value a = 1; value b = 10; a:b;", 1:10],
    ["3:-2", 3:-2]
    // TODO, characters, bytes, months
};

test
parameters(`value testEvaluateSegmentOpParameters`)
void testEvaluateSegmentOp(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}
