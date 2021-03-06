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
            case (is BaseMemberOrTypeExpression) evaluateBaseMemberOrTypeExpression(context, node)
            case (is Block) evaluateBlock(context, node)
            case (is CompareOp) evaluateCompareOp(context, node)
            case (is DecrementOp) evaluateDecrementOp(context, node)
            case (is DifferenceOp) evaluateDifferenceOp(context, node)
            case (is EqualOp) evaluateEqualOp(context, node)
            case (is Expression) evaluateExpression(context, node)
            case (is ExpressionStatement) evaluateExpressionStatement(context, node)
            case (is FloatLiteral) evaluateFloatLiteral(node)
            case (is IfStatement) evaluateIfStatement(context, node)
            case (is IncrementOp) evaluateIncrementOp(context, node)
            case (is InvocationExpression) evaluateInvocationExpression(context, node)
            case (is LargeAsOp) evaluateLargeAsOp(context, node)
            case (is LargerOp) evaluateLargerOp(context, node)
            case (is NaturalLiteral) evaluateNaturalLiteral(node)
            case (is NegativeOp) evaluateNegativeOp(context, node)
            case (is NotEqualOp) evaluateNotEqualOp(context, node)
            case (is PostfixDecrementOp) evaluatePostfixDecrementOp(context, node)
            case (is PostfixIncrementOp) evaluatePostfixIncrementOp(context, node)
            case (is ProductOp) evaluateProductOp(context, node)
            case (is QualifiedMemberExpression) evaluateQualifiedMemberExpression(context, node)
            case (is QuotientOp) evaluateQuotientOp(context, node)
            case (is RangeOp) evaluateRangeOp(context, node)
            case (is SegmentOp) evaluateSegmentOp(context, node)
            case (is SmallAsOp) evaluateSmallAsOp(context, node)
            case (is SmallerOp) evaluateSmallerOp(context, node)
            case (is SpecifierExpression) evaluateSpecifierExpression(context, node)
            case (is SpecifierStatement) evaluateSpecifierStatement(context, node)
            case (is StringLiteral) evaluateStringLiteral(node)
            case (is SumOp) evaluateSumOp(context, node)
            case (is WhileStatement) evaluateWhileStatement(context, node)
            else node;
