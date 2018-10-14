import ceylon.test {
    assertEquals,
    assertNotNull,
    test
}

import com.crappycomic.ceylonrepl {
    Context,
    undefined
}

// TODO: We may or may not allow declaration via these statements.
// If we do, "a = 1" will probably be equivalent to "value a = 1".
// We'll also want to have tests that verify the identifier is already known, variable, and
// correctly typed.

test
void testEvaluateSpecifierStatement() {
    value code = "a = 1;";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 1);
}

test
void testEvaluateSpecifierStatementLazy() {
    value code = "a => 1; a;";
    value context = Context();
    
    assertEquals(testEvaluate(code, context), 1);
    assertNotNull(context["a"]);
}

test
void testEvaluateSpecifierStatementDeclaredInInner() {
    value code = "a = 1;";
    value outerContext = Context();
    value innerContext = outerContext.inner;
    
    innerContext["a"] = 0;
    
    testEvaluate(code, innerContext);
    
    assertEquals(innerContext["a"], 1, "Inner context should have been updated");
    assertEquals(outerContext["a"], undefined, "Outer context should not have changed");
}

test
void testEvaluateSpecifierStatementDeclaredInOuter() {
    value code = "a = 1;";
    value outerContext = Context();
    value innerContext = outerContext.inner;
    
    outerContext["a"] = 0;
    
    testEvaluate(code, innerContext);
    
    assertEquals(innerContext["a"], undefined, "Inner context should not have changed");
    assertEquals(outerContext["a"], 1,
        "Inner context did not declare 'a', so outer context 'a' should have been updated");
}

test
void testEvaluateSpecifierStatementDeclaredInBoth() {
    value code = "a = 1;";
    value outerContext = Context();
    value innerContext = outerContext.inner;
    
    outerContext["a"] = 0;
    innerContext["a"] = 2;
    
    testEvaluate(code, innerContext);
    
    assertEquals(outerContext["a"], 0, "Outer context should not have changed");
    assertEquals(innerContext["a"], 1, "Inner context should have been updated");
}
