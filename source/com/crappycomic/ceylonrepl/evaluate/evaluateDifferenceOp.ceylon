import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateDifferenceOp(Context context, Tree.DifferenceOp operation) {
    value leftTerm = operation.leftTerm;
    value rightTerm = operation.rightTerm;
    
    if (!exists leftTerm) {
        return SyntaxError("Cannot evaluate a DifferenceOp with no left term");
    }
    
    if (!exists rightTerm) {
        return SyntaxError("Cannot evaluate a DifferenceOp with no right term");
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
    
    return `function Invertible.minus`.memberInvoke(left, [], right);
}
