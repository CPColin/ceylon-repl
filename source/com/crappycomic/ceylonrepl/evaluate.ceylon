import ceylon.ast.core {
    ...
}
import ceylon.ast.redhat {
    ...
}

"Using the given [[context]], evaluates the given [[node]] and returns its value, if any."
shared Anything evaluate(Context context, Node node)
        => switch (node) // TODO: wrap switch in parens, invoke once at the end
            case (is AssignOperation) evaluateAssignOperation(context, node)
            case (is BaseExpression) evaluateBaseExpression(context, node)
            case (is Block) evaluateBlock(context, node)
            case (is DifferenceOperation) evaluateDifferenceOperation(context, node)
            case (is FloatLiteral) evaluateFloatLiteral(context, node)
            case (is GroupedExpression) evaluateGroupedExpression(context, node)
            case (is IntegerLiteral) evaluateIntegerLiteral(context, node)
            case (is Invocation) evaluateInvocation(context, node)
            case (is InvocationStatement) evaluateInvocation(context, node.expression)
            case (is NegationOperation) evaluateNegationOperation(context, node)
            case (is PostfixDecrementOperation) evaluatePostfixDecrementOperation(context, node)
            case (is PostfixIncrementOperation) evaluatePostfixIncrementOperation(context, node)
            case (is PrefixDecrementOperation) evaluatePrefixDecrementOperation(context, node)
            case (is PrefixIncrementOperation) evaluatePrefixIncrementOperation(context, node)
            case (is PrefixPostfixStatement) evaluatePrefixPostfixStatement(context, node)
            case (is ProductOperation) evaluateProductOperation(context, node)
            case (is QualifiedExpression) evaluateQualifiedExpression(context, node)
            case (is QuotientOperation) evaluateQuotientOperation(context, node)
            case (is StringLiteral) evaluateStringLiteral(context, node)
            case (is SumOperation) evaluateSumOperation(context, node)
            case (is ValueDefinition) evaluateValueDefinition(context, node)
            case (is CharacterLiteral|StringTemplate|This|Super|Outer|Package|Iterable|Tuple|DynamicValue|ObjectExpression|ElementOrSubrangeExpression|TypeMeta|BaseMeta|MemberMeta|ClassDec|InterfaceDec|AliasDec|GivenDec|ValueDec|FunctionDec|ConstructorDec|PackageDec|ModuleDec|IdentityOperation|ExistsOperation|NonemptyOperation|NotOperation|IsOperation|OfOperation|ExponentiationOperation|RemainderOperation|IntersectionOperation|UnionOperation|ComplementOperation|ScaleOperation|SpanOperation|MeasureOperation|EntryOperation|InOperation|LargerOperation|SmallerOperation|LargeAsOperation|SmallAsOperation|CompareOperation|EqualOperation|NotEqualOperation|IdenticalOperation|AndOperation|OrOperation|ThenOperation|ElseOperation|AddAssignmentOperation|SubtractAssignmentOperation|MultiplyAssignmentOperation|DivideAssignmentOperation|RemainderAssignmentOperation|IntersectAssignmentOperation|UnionAssignmentOperation|ComplementAssignmentOperation|AndAssignmentOperation|OrAssignmentOperation|WithinOperation|FunctionExpression|LetExpression|IfElseExpression|SwitchCaseElseExpression|ValueSpecification|LazySpecification|AssignmentStatement|Assertion|Return|Throw|Break|Continue|IfElse|While|ForFail|SwitchCaseElse|TryCatchFinally|DynamicBlock|Destructure|ClassDefinition|ClassAliasDefinition|InterfaceDefinition|DynamicInterfaceDefinition|InterfaceAliasDefinition|TypeAliasDefinition|ValueDeclaration|ValueGetterDefinition|FunctionDeclaration|FunctionDefinition|FunctionShortcutDefinition|ObjectDefinition|ValueSetterDefinition|CallableConstructorDefinition|ValueConstructorDefinition|Annotation|Annotations|ValueParameter|CallableParameter|ParameterReference|DefaultedValueParameter|DefaultedCallableParameter|DefaultedParameterReference|VariadicParameter|TypeParameter|TypeParameters|CaseTypes|SatisfiedTypes|TypeConstraint|PackageDescriptor|ModuleImport|ModuleBody|ModuleDescriptor|ImportAlias|ImportWildcard|ImportElement|ImportElements|Import|CompilationUnit|ModuleCompilationUnit|PackageCompilationUnit|BooleanCondition|IsCondition|ExistsCondition|NonemptyCondition|Conditions|IfClause|ElseClause|ExtendedType|ClassSpecifier|TypeSpecifier|TypedVariable|SpecifiedVariable|UnspecifiedVariable|VariadicVariable|ForIterator|ForClause|FailClause|ForComprehensionClause|IfComprehensionClause|ExpressionComprehensionClause|FinallyClause|CatchClause|Resource|Resources|TryClause|MatchCase|IsCase|CaseClause|SwitchCases|SwitchClause|UnionType|IntersectionType|BaseType|QualifiedType|TupleType|IterableType|GroupedType|OptionalType|SequentialType|CallableType|EntryType|TypeNameWithTypeArguments|MemberNameWithTypeArguments|VariadicType|DefaultedType|TypeList|SpreadType|TypeArgument|TypeArguments|PackageQualifier|LIdentifier|UIdentifier|FullPackageName|ArgumentList|SpreadArgument|PositionalArguments|NamedArguments|AnonymousArgument|SpecifiedArgument|ValueArgument|FunctionArgument|ObjectArgument|Specifier|LazySpecifier|Parameters|OpenBound|ClosedBound|ValueModifier|FunctionModifier|VoidModifier|DynamicModifier|InModifier|OutModifier|ClassBody|InterfaceBody|Comprehension|KeySubscript|SpanSubscript|MeasureSubscript|SpanFromSubscript|SpanToSubscript|DecQualifier|MemberOperator|SafeMemberOperator|SpreadMemberOperator|VariablePattern|TuplePattern|EntryPattern|SpecifiedPattern|PatternList|CaseExpression|Extension|Construction|ModuleSpecifier) node;
