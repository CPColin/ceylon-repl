import com.redhat.ceylon.compiler.typechecker.tree {
    Node,
    Tree {
        ...
    }
}
import com.crappycomic.ceylonrepl {
    Context
}

"Using the given [[context]], evaluates the given [[node]] and returns its value, if any."
shared Anything evaluate(Context context, Node node)
        => switch (node)
            case (is AttributeDeclaration) evaluateAttributeDeclaration(context, node)
            case (is Block) evaluateBlock(context, node)
            case (is DifferenceOp) evaluateDifferenceOp(context, node)
            case (is Expression) evaluateExpression(context, node)
            case (is ExpressionStatement) evaluateExpressionStatement(context, node)
            case (is FloatLiteral) evaluateFloatLiteral(node)
            case (is NaturalLiteral) evaluateNaturalLiteral(node)
            case (is NegativeOp) evaluateNegativeOp(context, node)
            case (is ProductOp) evaluateProductOp(context, node)
            case (is QuotientOp) evaluateQuotientOp(context, node)
            case (is StringLiteral) evaluateStringLiteral(node)
            case (is SumOp) evaluateSumOp(context, node)
            else node;
