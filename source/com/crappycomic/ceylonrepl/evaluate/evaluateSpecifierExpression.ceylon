import com.crappycomic.ceylonrepl {
    Context
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateSpecifierExpression(Context context, Tree.SpecifierExpression expression)
        => if (expression is Tree.LazySpecifierExpression)
            then expression.expression
            else evaluate(context, expression.expression);
