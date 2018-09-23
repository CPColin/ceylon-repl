import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Float]*} testEvaluateFloatLiteralParameters = {
    ["0.0", 0.0],
    ["5.0e6", 5.0e6],
    ["5.0e-6", 5.0e-6],
    ["1u", 1u],
    ["1_000.5k", 1_000.5k]
};

test
parameters(`value testEvaluateFloatLiteralParameters`)
shared void testEvaluateFloatLiteral(String code, Float expected) {
    assertEquals(testEvaluate(code), expected);
}
