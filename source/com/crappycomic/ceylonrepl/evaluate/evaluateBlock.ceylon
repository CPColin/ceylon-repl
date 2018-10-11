import com.crappycomic.ceylonrepl {
    Context
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateBlock(Context context, Tree.Block block) {
    variable Anything result = null;
    
    for (statement in block.statements) {
        result = evaluate(context, statement);
    }
    
    return result;
}
