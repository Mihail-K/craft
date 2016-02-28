
module craft.ast.visitor;

import craft.ast;

interface Visitor
{
    void visit(AdditionNode node);

    void visit(AssignmentNode node);

    void visit(BitshiftNode node);

    void visit(BitwiseNode node);

    void visit(EqualityNode node);

    void visit(IdentifierNode.Dollar node);

    void visit(IdentifierNode.Lower node);

    void visit(IdentifierNode.Upper node);

    void visit(LogicalNode node);

    void visit(MultiplicationNode node);

    void visit(RelationNode node);

    void visit(TernaryNode node);
}

mixin template Visitable()
{
    override void accept(Visitor visitor)
    {
        visitor.visit(this);
    }
}
