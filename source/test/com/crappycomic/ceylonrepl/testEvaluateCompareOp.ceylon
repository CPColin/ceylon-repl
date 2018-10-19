import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, Comparison]*} testEvaluateCompareOpParameters = {
    ["1 <=> 1", equal],
    ["1 <=> 2", smaller],
    ["2 <=> 1", larger],
    ["1.0 <=> 1.0", equal],
    ["1.0 <=> 2.0", smaller],
    ["2.0 <=> 1.0", larger],
    ["\"hello\" <=> \"hello\"", equal],
    ["\"hello\" <=> \"goodbye\"", larger],
    ["\"goodbye\" <=> \"hello\"", smaller]
};

test
parameters(`value testEvaluateCompareOpParameters`)
void testEvaluateCompareOp(String code, Comparison expected) {
    assertEquals(testEvaluate(code), expected);
}
