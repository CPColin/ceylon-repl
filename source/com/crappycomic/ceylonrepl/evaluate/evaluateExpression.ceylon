import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}
import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}

Anything evaluateExpression(Context context, Tree.Expression expression) {
    if (exists term = expression.term) {
        return evaluate(context, term);
    } else {
        return SyntaxError("Could not evaluate empty expression");
    }
}
