import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}
import ceylon.language.meta.model {
    IncompatibleTypeException
}

Anything evaluateQuotientOp(Context context, Tree.QuotientOp operation) {
    value leftTerm = operation.leftTerm;
    value rightTerm = operation.rightTerm;
    
    if (!exists leftTerm) {
        return SyntaxError("Cannot evaluate a QuotientOp with no left term");
    }
    
    if (!exists rightTerm) {
        return SyntaxError("Cannot evaluate a QuotientOp with no right term");
    }
    
    value left = evaluate(context, leftTerm);
    
    if (is SyntaxError left) {
        return left;
    }
    
    if (!exists left) {
        return SyntaxError("Left operand cannot be null");
    }
    
    value right = evaluate(context, rightTerm);
    
    if (is SyntaxError right) {
        return right;
    }
    
    try {
        return `function Numeric.divided`.memberInvoke(left, [], right);
    } catch (IncompatibleTypeException e) {
        return SyntaxError("Incompatible types: ``e.string``");
    }
}
