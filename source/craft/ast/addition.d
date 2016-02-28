
module craft.ast.addition;

import craft.ast;
import craft.lexer;

final class AdditionNode : BinaryNode
{
    mixin Visitable;

    this(ExpressionNode left, LexerToken operator, ExpressionNode right)
    {
        super(left, operator, right);
    }
}
