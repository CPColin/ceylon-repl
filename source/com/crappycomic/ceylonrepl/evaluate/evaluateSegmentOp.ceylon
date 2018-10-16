import ceylon.language.meta.model {
    IncompatibleTypeException
}

import com.crappycomic.ceylonrepl {
    Context,
    SyntaxError
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree
}

Anything evaluateSegmentOp(Context context, Tree.SegmentOp operation) {
    value leftTerm = operation.leftTerm;
    value rightTerm = operation.rightTerm;
    
    if (!exists leftTerm) {
        return SyntaxError("Cannot evaluate a SegmentOp with no left term");
    }
    
    if (!exists rightTerm) {
        return SyntaxError("Cannot evaluate a SegmentOp with no right term");
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
        return `function measure`.invoke([`Integer`], left, right);
    } catch (IncompatibleTypeException e) {
        return SyntaxError("Incompatible types: ``e.string``");
    }
}
