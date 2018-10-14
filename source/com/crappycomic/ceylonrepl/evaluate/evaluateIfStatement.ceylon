import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

// TODO: we have to dip into IfClause here, so we know which block gets evaluated next, but we
// should probably have a dedicated evaluateConditionList function, before too long
Anything evaluateIfStatement(Context context, Tree.IfStatement statement) {
    assert (exists ifClause = statement.ifClause);
    assert (exists conditionList = ifClause.conditionList);
    assert (exists conditions = conditionList.conditions);
    "TODO"
    assert (conditions.size() == 1);
    "TODO"
    assert (is Tree.BooleanCondition condition = conditions[0]);
    
    value result = evaluate(context, condition.expression);
    
    if (result is SyntaxError) {
        return result;
    }
    
    if (!is Boolean result) {
        return SyntaxError("If condition did not evaluate to a Boolean: ``result else "<null>"``");
    }
    
    if (result) {
        assert (exists block = ifClause.block);
        
        return evaluate(context.inner, block);
    } else if (exists elseClause = statement.elseClause) {
        assert (exists block = elseClause.block);
        
        // Thanks to ceylon.ast for showing how this works out.
        if (block.mainToken exists) {
            // Just an "else"
            return evaluate(context.inner, block);
        } else {
            // Actually an "else if"
            assert (exists statements = block.statements);
            assert (statements.size() == 1);
            assert (is Tree.IfStatement elseIfStatement = statements[0]);
            
            return evaluate(context, elseIfStatement);
        }
    }
    
    return undefined;
}
