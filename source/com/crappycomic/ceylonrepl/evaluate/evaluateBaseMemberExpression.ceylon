import com.crappycomic.ceylonrepl {
    Context
}
import com.crappycomic.ceylonrepl.resolve {
    BoundValueDeclaration,
    resolveBaseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Node,
    Tree
}

Anything evaluateBaseMemberExpression(Context context, Tree.BaseMemberExpression expression) {
    value resolved = resolveBaseExpression(context, expression);
    
    if (is BoundValueDeclaration resolved) {
        value val = resolved.get();
        
        if (is Node val) {
            return evaluate(context, val);
        } else {
            return val;
        }
    } else {
        return resolved;
    }
}
