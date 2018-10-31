import ceylon.test {
    assertEquals,
    parameters,
    test
}

import com.crappycomic.ceylonrepl {
    Context,
    undefined
}

{[Boolean, Integer]*} testEvaluateIfStatementIfBlockOnlyParameters = {
    [true, 2],
    [false, 1]
};

test
parameters(`value testEvaluateIfStatementIfBlockOnlyParameters`)
void testEvaluateIfStatementIfBlockOnly(Boolean b, Integer expected) {
    value code = "variable value a = 1;
                  value b = ``b``;
                  
                  if (b) {
                      a = 2;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], expected);
}

{[Boolean, Integer]*} testEvaluateIfStatementIfAndElseBlockParameters = {
    [true, 2],
    [false, 3]
};

test
parameters(`value testEvaluateIfStatementIfAndElseBlockParameters`)
void testEvaluateIfStatementIfAndElseBlock(Boolean b, Integer expected) {
    value code = "variable value a = 1;
                  value b = ``b``;
                  
                  if (b) {
                      a = 2;
                  } else {
                      a = 3;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], expected);
}

{[Boolean, Boolean, Integer]*} testEvaluateIfStatementIfAndElseIfBlockParameters = {
    [true, true, 2],
    [true, false, 2],
    [false, true, 3],
    [false, false, 1]
};

test
parameters(`value testEvaluateIfStatementIfAndElseIfBlockParameters`)
void testEvaluateIfStatementIfAndElseIfBlock(Boolean b, Boolean c, Integer expected) {
    value code = "variable value a = 1;
                  value b = ``b``;
                  value c = ``c``;
                  
                  if (b) {
                      a = 2;
                  } else if (c) {
                      a = 3;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], expected);
}

{[Boolean, Boolean, Integer]*} testEvaluateIfStatementIfElseIfElseBlockParameters = {
    [true, true, 2],
    [true, false, 2],
    [false, true, 3],
    [false, false, 4]
};

test
parameters(`value testEvaluateIfStatementIfElseIfElseBlockParameters`)
void testEvaluateIfStatementIfElseIfElseBlock(Boolean b, Boolean c, Integer expected) {
    value code = "variable value a = 1;
                  value b = ``b``;
                  value c = ``c``;
                  
                  if (b) {
                      a = 2;
                  } else if (c) {
                      a = 3;
                  } else {
                      a = 4;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], expected);
}

test
void testEvaluateIfStatementIfBlockContext() {
    value code = "if (true) {
                      value a = 1;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], undefined);
}

test
void testEvaluateIfStatementElseBlockContext() {
    value code = "if (false) {
                      value a = 1;
                  } else {
                      value a = 2;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], undefined);
}

test
void testEvaluateIfStatementElseIfBlockContext() {
    value code = "if (false) {
                      value a = 1;
                  } else if (true) {
                      value a = 2;
                  } else {
                      value a = 3;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], undefined);
}

test
void testEvaluateIfExistsNotNull() {
    value code = "variable value a = 1;
                  
                  if (exists a) {
                      a = 2;
                  } else {
                      a = 3;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 2);
}

test
void testEvaluateIfExistsNull() {
    value code = "variable value a = null;
                  
                  if (exists a) {
                      a = 1;
                  } else {
                      a = 2
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 2);
}

test
void testEvaluateIfNotExistsNotNull() {
    value code = "variable value a = 1;
                  
                  if (!exists a) {
                      a = 2;
                  } else {
                      a = 3;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 3);
}

test
void testEvaluateIfNotExistsNull() {
    value code = "variable value a = null;
                  
                  if (!exists a) {
                      a = 1;
                  } else {
                      a = 2
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 1);
}
