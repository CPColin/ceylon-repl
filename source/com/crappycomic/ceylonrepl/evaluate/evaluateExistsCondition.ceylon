import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Node,
    Tree
}

Boolean|SyntaxError evaluateExistsCondition(Context context, Tree.ExistsCondition condition) {
    if (condition.brokenExpression exists) {
        return SyntaxError("ExistsCondition has a BrokenExpression");
    }
    
    assert (is Tree.Variable variable = condition.variable);
    assert (exists expression = variable.specifierExpression);
    
    value result = evaluate(context, expression);
    
    if (is SyntaxError result) {
        return result;
    }
    
    if (is Node result) {
        return SyntaxError("ExistsCondition result was a Node: ``result``");
    }
    
    value resultExists = result exists;
    
    return condition.not then !resultExists else resultExists;
}
