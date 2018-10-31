import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Boolean|SyntaxError evaluateBooleanCondition(Context context, Tree.BooleanCondition condition) {
    value result = evaluate(context, condition.expression);
    
    if (is Boolean|SyntaxError result) {
        return result;
    } else {
        return SyntaxError("BooleanConditional did not resolve to a Boolean value: ``result else "<null>"``");
    }
}
