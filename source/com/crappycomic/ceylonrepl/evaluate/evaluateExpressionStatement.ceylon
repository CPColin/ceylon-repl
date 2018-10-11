import com.crappycomic.ceylonrepl {
    Context
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateExpressionStatement(Context context, Tree.ExpressionStatement statement) {
    return evaluate(context, statement.expression);
}
