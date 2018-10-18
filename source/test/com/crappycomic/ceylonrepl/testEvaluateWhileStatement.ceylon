import ceylon.test {
    assertEquals,
    test
}

import com.crappycomic.ceylonrepl {
    Context
}

// TODO: couldn't use a++ because it kept updating the inner context

test
void testEvaluateWhileStatement() {
    value code = "variable value a = 0;
                  while (a != 5) {
                      a++;
                  }";
    value context = Context();
    
    testEvaluate(code, context);
    
    assertEquals(context["a"], 5);
}
