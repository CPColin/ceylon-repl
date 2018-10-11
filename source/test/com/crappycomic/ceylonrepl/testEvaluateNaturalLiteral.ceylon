import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Integer]*} testEvaluateNaturalLiteralParameters = {
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
parameters(`value testEvaluateNaturalLiteralParameters`)
shared void testEvaluateNaturalLiteral(String code, Integer expected) {
    assertEquals(testEvaluate(code), expected);
}
