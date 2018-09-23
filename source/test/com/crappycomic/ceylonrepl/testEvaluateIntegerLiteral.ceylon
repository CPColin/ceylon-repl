import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Integer]*} testEvaluateIntegerLiteralParameters = {
    ["0", 0],
    ["5", 5],
    ["5k", 5000],
    ["1_000_000", 1_000_000],
    ["#ff", #ff],
    ["#ff_00", #ff_00],
    ["$1000", $1000],
    ["$1000_0101", $1000_0101]
};

test
parameters(`value testEvaluateIntegerLiteralParameters`)
shared void testEvaluateIntegerLiteral(String code, Integer expected) {
    assertEquals(testEvaluate(code), expected);
}
