import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

{[String, Anything]*} testEvaluateInvocationExpressionParameters = {
    ["\"a\".repeat(5)", "aaaaa"],
    [""""hello".replace("hell", "heck")""", "hecko"],
    ["identical(true, true)", true],
    ["identical(false, true)", false],
    ["identical(false, false)", true],
    ["identity(123)", 123],
    ["Integer(5)", 5]
    //["smallest(3, 4)", 3] TODO: type parameters with upper bounds
};

test
parameters(`value testEvaluateInvocationExpressionParameters`)
void testEvaluateInvocationExpression(String code, Anything expected) {
    assertEquals(testEvaluate(code), expected);
}

test
void testEvaluateInstantiation() {
    value context = Context();
    
    testEvaluate("value a = StringBuilder()", context);
    
    assertType<StringBuilder>(context["a"]);
}
