import raylib as rl
import raylibc as c

rl.InitWindow(432, 243, "SmallBASIC/Raylib - Passo 1: O Palco")
rl.SetTargetFPS(60)

while (!rl.WindowShouldClose())
    rl.BeginDrawing()
        rl.ClearBackground(c.RAYWHITE)
    rl.EndDrawing()
wend
rl.CloseWindow()