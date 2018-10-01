import ceylon.test {
    assertEquals,
    assertTrue,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[String, Anything]*} testEvaluateInvocationParameters = {
    ["\"a\".repeat(5)", "aaaaa"],
    [""""hello".replace("hell", "heck")""", "hecko"],
    ["identical(true, true)", true],
    ["identical(false, true)", false],
    ["identical(false, false)", true],
    ["identity(123)", 123]
    //["smallest(3, 4)", 3] TODO: type parameters with upper bounds
    //["Integer(5)", 5] TODO: Parse error
};

test
parameters(`value testEvaluateInvocationParameters`)
void testEvaluateInvocation(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}

test
void testEvaluateInstantiation() {
    value context = Context();
    
    testEvaluate("value a = StringBuilder()", context);
    
    assertType<StringBuilder>(context["a"]);
}
