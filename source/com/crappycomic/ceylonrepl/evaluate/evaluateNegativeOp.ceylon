import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}
import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}

Anything|SyntaxError evaluateNegativeOp(Context context, Tree.NegativeOp operation) {
    value term = operation.term;
    
    if (!exists term) {
        return SyntaxError("Could not evaluate empty NegativeOp");
    }
    
    value positive = evaluate(context, term);
    
    if (is SyntaxError positive) {
        return positive;
    } else if (is Invertible<in Nothing> positive) {
        return positive.negated;
    } else {
        return SyntaxError("Operand cannot be negated");
    }
}
