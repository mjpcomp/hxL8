package hxl8.commands;

import haxe.io.BytesBuffer;

import hxl8.commands.L8CmdBase;

class L8CmdAppRunColorChanger extends L8CmdAppRun
{
    private var m_colors : Int;
    private var m_speed : Int;
    private var m_invertSuperLED : Bool;
    
    public function new (colors : Int, speed : Int, invertSuperLED : Bool)
    {
        super ();
        switch (colors)
        {
            case 1, 2, 3, 4:
                m_colors = colors;
            default:
                m_colors = 1;
        }
        m_speed = speed;
        m_invertSuperLED = invertSuperLED;
    }
    override public function getBytes () : BytesBuffer
    {
        var buffer : BytesBuffer = super.getBytes ();
        buffer.addByte (2);
        buffer.addByte (m_colors);
        buffer.addByte (m_speed);
        if (m_invertSuperLED)
        {
            buffer.addByte (1);
        }
        else
        {
            buffer.addByte (0);
        }
        return buffer;   
    }
}