import ceylon.test {
    assertEquals,
    parameters,
    test
}

{[String, String]*} testEvaluateStringLiteralParameters = {
    ["hello world", "hello world"],
    ["hello
       world",
     "hello
      world"],
    //["hello\\tworld", "hello\tworld"],
    //["hello \\\"world\\\"", "hello \"world\""],
    //[""""\{HEAVY BLACK HEART}"""", "\{HEAVY BLACK HEART}"], TODO: do CharacterLiteral first
    //[""""two: ``1 + 1``""", "two: 2"], TODO: StringTemplate
    ["\"\"hello world\"\"", "hello world"]
};

test
parameters(`value testEvaluateStringLiteralParameters`)
shared void testEvaluateStringLiteral(String code, String expected) {
    assertEquals(testEvaluate("\"``code``\""), expected);
}
