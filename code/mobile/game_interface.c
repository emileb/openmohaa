//#include "quakedef.h"


#include "SDL.h"
#include "SDL_keycode.h"

#include "..//client/client.h"
#include "..//renderergl1/tr_local.h"

#include "game_interface.h"

#include "SmartToggle.h"
#include "CStringFifo.h"

static float look_pitch_mouse, look_pitch_joy;
static float look_yaw_mouse, look_yaw_joy;;
static CStringFIFO m_CmdFifo;

int main_android(int c, const char **v);

void PortableInit(int argc, const char **argv)
{
    LOGI("PortableInit");
    cstr_fifo_init(&m_CmdFifo);
    main_android(argc, argv);
}


extern int SDL_SendKeyboardKey(Uint8 state, SDL_Scancode scancode);

int PortableKeyEvent(int state, int code, int unitcode)
{
    //LOGI("PortableKeyEvent %d %d",state,code);

    if(state)
        SDL_SendKeyboardKey(SDL_PRESSED, (SDL_Scancode) code);
    else
        SDL_SendKeyboardKey(SDL_RELEASED, (SDL_Scancode) code);

    return 0;
}

void PortableCommand(const char *cmd)
{
    cstr_fifo_push(&m_CmdFifo, cmd);
}

void PortableAutomapControl(float zoom, float x, float y)
{

}

void KeyUpPort(kbutton_t *b)
{
    b->active = qfalse;
}

void KeyDownPort(kbutton_t *b)
{
    b->active = qtrue;
    b->wasPressed = qtrue;
}

static int KeyIsDown(kbutton_t *b)
{
    return b->active;
}

extern kbutton_t in_left, in_right, in_forward, in_back;
extern kbutton_t in_lookup, in_lookdown, in_moveleft, in_moveright;
extern kbutton_t in_strafe, in_speed;
extern kbutton_t in_up, in_down;
extern kbutton_t in_buttons[16];


static int zoomed = 0; //toggle zoom
static int scoresShown = 0;

void PortableAction(int state, int action)
{
    LOGI("PortableAction %d %d", state, action);

    if((action >= PORT_ACT_CUSTOM_0) && (action <= PORT_ACT_CUSTOM_17))
    {
        PortableKeyEvent(state, SDL_SCANCODE_H + action - PORT_ACT_CUSTOM_0, 0);
    }

    if((PortableGetScreenMode() == TS_MENU) || (PortableGetScreenMode() == TS_BLANK) || (PortableGetScreenMode() == TS_Y_N))
    {
        if(action >= PORT_ACT_MENU_UP && action <= PORT_ACT_MENU_ABORT)
        {
            int sdl_code[] = {SDL_SCANCODE_UP, SDL_SCANCODE_DOWN, SDL_SCANCODE_LEFT,
                              SDL_SCANCODE_RIGHT, SDL_SCANCODE_RETURN, SDL_SCANCODE_ESCAPE, SDL_SCANCODE_Y, SDL_SCANCODE_N};

            PortableKeyEvent(state, sdl_code[action - PORT_ACT_MENU_UP], 0);

            return;
        }
        else if(action == PORT_ACT_MOUSE_LEFT || action == PORT_ACT_MOUSE_RIGHT)
        {
            int b = K_MOUSE1;

            if(action == PORT_ACT_MOUSE_LEFT)
                b = K_MOUSE1;
            else if(action == PORT_ACT_MOUSE_RIGHT)
                b = K_MOUSE2;

            Com_QueueEvent(0, SE_KEY, b, state ? qtrue : qfalse, 0, NULL);
        }
    }
    else if(((action >= PORT_ACT_WEAP0) && (action <= PORT_ACT_WEAP9)))
    {
        int code = 0;
        if(action == PORT_ACT_WEAP0)
            code = SDL_SCANCODE_0;
        else
            code = SDL_SCANCODE_1 + action - PORT_ACT_WEAP1;

        PortableKeyEvent(state, code, 0);
    }
    else
    {
        switch(action)
        {
            case PORT_ACT_LEFT:
                (state) ? KeyDownPort(&in_left) : KeyUpPort(&in_left);
                break;
            case PORT_ACT_RIGHT:
                (state) ? KeyDownPort(&in_right) : KeyUpPort(&in_right);
                break;
            case PORT_ACT_FWD:
                (state) ? KeyDownPort(&in_forward) : KeyUpPort(&in_forward);
                break;
            case PORT_ACT_BACK:
                (state) ? KeyDownPort(&in_back) : KeyUpPort(&in_back);
                break;
            case PORT_ACT_LOOK_UP:
                (state) ? KeyDownPort(&in_lookup) : KeyUpPort(&in_lookup);
                break;
            case PORT_ACT_LOOK_DOWN:
                (state) ? KeyDownPort(&in_lookdown) : KeyUpPort(&in_lookdown);
                break;
            case PORT_ACT_MOVE_LEFT:
                (state) ? KeyDownPort(&in_moveleft) : KeyUpPort(&in_moveleft);
                break;
            case PORT_ACT_MOVE_RIGHT:
                (state) ? KeyDownPort(&in_moveright) : KeyUpPort(&in_moveright);
                break;
            case PORT_ACT_STRAFE:
                (state) ? KeyDownPort(&in_strafe) : KeyUpPort(&in_strafe);
                break;
            case PORT_ACT_SPEED:
                (state) ? KeyDownPort(&in_speed) : KeyUpPort(&in_speed);
                break;
            case PORT_ACT_ZOOM_IN:
            {
                static SmartToggle_t smartToggle;
                int activate = SmartToggleAction(&smartToggle, state, zoomed);
                if(activate)
                {
                    zoomed = 1;
                    PortableCommand("+zoom\n");
                }
                else
                {
                    zoomed = 0;
                    PortableCommand("-zoom\n");
                }
            }
                break;
            case PORT_ACT_USE:
                (state) ? KeyDownPort(&in_buttons[3]) : KeyUpPort(&in_buttons[3]);
                break;
            case PORT_ACT_ATTACK:
                (state) ? KeyDownPort(&in_buttons[0]) : KeyUpPort(&in_buttons[0]);
                break;
            case PORT_ACT_ALT_ATTACK:
                (state) ? KeyDownPort(&in_buttons[1]) : KeyUpPort(&in_buttons[1]);
                break;
            case PORT_ACT_RELOAD:
                PortableCommand("reload\n");
                break;
            case PORT_ACT_JUMP:
                //Jump is same as up
            case PORT_ACT_UP:
                (state) ? KeyDownPort(&in_up) : KeyUpPort(&in_up);
                break;
            case PORT_ACT_DOWN:
            case PORT_ACT_TOGGLE_CROUCH:
                (state) ? KeyDownPort(&in_down) : KeyUpPort(&in_down);
                break;
                //TODO make fifo, possibly not thread safe!!
            case PORT_ACT_NEXT_WEP:
                if(state)
                    PortableCommand("weapnext\n");
                break;
            case PORT_ACT_PREV_WEP:
                if(state)
                    PortableCommand("weapprev\n");
                break;
            case PORT_ACT_CONSOLE:
                PortableKeyEvent(state, SDL_SCANCODE_GRAVE, 0);
                break;
            case PORT_ACT_QUICKSAVE:
                if(state)
                    PortableCommand("savegame quick\n");
                break;
            case PORT_ACT_QUICKLOAD:
                if(state)
                    PortableCommand("loadgame quick\n");
                break;
            case PORT_ACT_DATAPAD:
                PortableKeyEvent(state, SDL_SCANCODE_TAB, 0);
                break;
        }
    }
}


touchscreemode_t PortableGetScreenMode()
{
    if((Key_GetCatcher() & KEYCATCH_UI) ||
       (Key_GetCatcher() & KEYCATCH_CGAME) ||
       (Key_GetCatcher() & KEYCATCH_CONSOLE) ||
       !cls.cgameStarted)
    {
        return TS_MENU;
    }
    else
    {
        return TS_GAME;
    }
}

void PortableBackButton()
{
    LOGI("Back button");
    PortableKeyEvent(1, SDL_SCANCODE_ESCAPE, 0);
    PortableKeyEvent(0, SDL_SCANCODE_ESCAPE, 0);
}

void PortableMouse(float dx, float dy)
{
    dx *= 1500;
    dy *= 1200;

    Com_QueueEvent(0, SE_MOUSE, -dx, -dy, 0, NULL);
}


// =================== FORWARD and SIDE MOVMENT ==============

float forwardmove, sidemove; //Joystick mode

void PortableMoveFwd(float fwd)
{
    if(fwd > 1)
        fwd = 1;
    else if(fwd < -1)
        fwd = -1;

    forwardmove = fwd;
}

void PortableMoveSide(float strafe)
{
    if(strafe > 1)
        strafe = 1;
    else if(strafe < -1)
        strafe = -1;

    sidemove = strafe;
}

void PortableMove(float fwd, float strafe)
{
    PortableMoveFwd(fwd);
    PortableMoveSide(strafe);
}

//======================================================================

//Look up and down
void PortableLookPitch(int mode, float pitch)
{
    switch(mode)
    {
        case LOOK_MODE_MOUSE:
            look_pitch_mouse += pitch;
            break;
        case LOOK_MODE_JOYSTICK:
            look_pitch_joy = pitch;
            break;
    }
}

//left right
void PortableLookYaw(int mode, float yaw)
{
    switch(mode)
    {
        case LOOK_MODE_MOUSE:
            look_yaw_mouse += yaw;
            break;
        case LOOK_MODE_JOYSTICK:
            look_yaw_joy = yaw;
            break;
    }
}

bool PortableSetAlwaysRun(bool run)
{
    if(run)
    {
        PortableCommand("cl_run 1\n");
    }
    else
    {
        PortableCommand("cl_run 0\n");
    }
    return false;
}

void IN_Android_Commands()
{
    char *consoleCmd;
    while((consoleCmd = cstr_fifo_pop(&m_CmdFifo)))
    {
        Cmd_ExecuteString(consoleCmd);
        free(consoleCmd);
    }

    if(PortableGetScreenMode() == TS_MENU)
    {
        if(look_yaw_joy || look_pitch_joy)
        {
            Com_QueueEvent(0, SE_MOUSE, -look_yaw_joy * 10, look_pitch_joy * 10, 0, NULL);
        }
    }
}

/////////////////////
// Movement handling
////
void CL_AndroidMove(usercmd_t *cmd, float frame_msec)
{
    int blockGamepad(void);
    int blockMove = blockGamepad() & ANALOGUE_AXIS_FWD;
    int blockLook = blockGamepad() & ANALOGUE_AXIS_PITCH;

    int fwdSpeed = 127;
    int sideSpeed = 127;

    int isPlayerRunning();
    if(!isPlayerRunning())
    {
        fwdSpeed = fwdSpeed / 2;
        sideSpeed = sideSpeed / 2;
    }

    if(!blockMove)
    {
        cmd->forwardmove = ClampChar(cmd->forwardmove + forwardmove * fwdSpeed);
        cmd->rightmove = ClampChar(cmd->rightmove + sidemove * sideSpeed);
    }

    if(!blockLook)
    {
        cl.viewangles[PITCH] += -look_pitch_mouse * 300;
        look_pitch_mouse = 0;
        cl.viewangles[PITCH] += look_pitch_joy * 6 * (frame_msec / 16.f); // Presume was scaled at 60FPS;


        cl.viewangles[YAW] += look_yaw_mouse * 500;
        look_yaw_mouse = 0;
        cl.viewangles[YAW] += look_yaw_joy * 6 * (frame_msec / 16.f); // Presume was scaled at 60FPS;
    }
}
