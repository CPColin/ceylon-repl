import com.crappycomic.ceylonrepl {
    Context,
    undefined
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateBlock(Context context, Tree.Block block) {
    variable Anything result = undefined;
    
    for (statement in block.statements) {
        result = evaluate(context, statement);
    }
    
    return result;
}
