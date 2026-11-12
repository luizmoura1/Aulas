import raylib as rl

rl.InitWindow(480, 270, "SmallBASIC/Raylib - Passo 0: Janela")
rl.SetTargetFPS(60)

while (!rl.WindowShouldClose())
    rl.BeginDrawing()
    rl.ClearBackground([0, 200, 0])
    rl.EndDrawing()
wend
rl.CloseWindow()


