
module craft.types.boolean;

import craft.types;

import std.string;

class CraftBoolean : CraftObject
{
private:
    static CraftBoolean TRUE;
    static CraftBoolean FALSE;

    static this()
    {
        TRUE  = new CraftBoolean(true);
        FALSE = new CraftBoolean(false);
    }

    bool _value;

    this(bool value)
    {
        super(BooleanClass.value);

        _value = value;
    }

public:
    static CraftBoolean create(bool value)
    {
        return value ? TRUE : FALSE;
    }

    @property
    bool value() inout nothrow
    {
        return _value;
    }

    override string toString()
    {
        return "Boolean(%s)";
    }
}

final class BooleanClass : CraftClass
{
private:
    static CraftClass CLASS;

    static this()
    {
        CLASS = new BooleanClass;

        CLASS.method("opNegate", new NativeMethod(0, &booleanNegate));
    }

    this()
    {
        super(ClassClass.value);
    }

public:
    @property
    static CraftClass value() nothrow
    {
        return CLASS;
    }
}

private
{
    /+ - Unary Operations - +/

    CraftObject booleanNegate(CraftObject instance, Arguments arguments)
    {
        return CraftBoolean.create(!instance.as!CraftBoolean.value);
    }
}
