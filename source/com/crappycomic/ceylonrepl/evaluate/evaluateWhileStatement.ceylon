import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    Undefined,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

SyntaxError|Undefined evaluateWhileStatement(Context context, Tree.WhileStatement statement) {
    assert (exists whileClause = statement.whileClause);
    assert (exists conditionList = whileClause.conditionList);
    assert (exists conditions = conditionList.conditions);
    "TODO"
    assert (conditions.size() == 1);
    "TODO"
    assert (is Tree.BooleanCondition condition = conditions[0]);
    
    while (true) {
        value result = evaluate(context, condition.expression);
        
        if (is SyntaxError result) {
            return result;
        }
        
        if (!is Boolean result) {
            return SyntaxError("While condition evaluated to a non-Boolean value: ``result else "<null>"``");
        }
        
        if (!result) {
            break;
        }
        
        assert (exists block = whileClause.block);
        
        evaluate(context.inner, block);
    }
    
    return undefined;
}
