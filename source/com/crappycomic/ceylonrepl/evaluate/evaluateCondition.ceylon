import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Boolean|SyntaxError evaluateCondition(Context context, Tree.Condition condition)
        => switch (condition)
            case (is Tree.BooleanCondition) evaluateBooleanCondition(context, condition)
            else SyntaxError("Unsupported Condition type");
