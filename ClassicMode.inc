  procedure classicMode();
  const
    ctDelay = 50;
    foodCnt = 50;
  type
    point = record
      x: integer;
      y: integer;
    end;
  var
    i, j, l, k, d, r1, r2, choice: integer;
    ts: real;
    board: array[1..100, 1..100] of integer;  //1: wall, 2: snake, 3: food
    sBody: array[1..100 * 100] of point;
    score: integer;
    dead: boolean;
    c:  char;
  begin
    txtB(Black);
    ClrScr();
    score := 3;
    ts := TimeStampToMSecS(DateTimeToTimeStamp(now));
    dead := False;
    d  := 1;
    {Create map borders}
    for i := 1 to min(scrH - 1, 100) do
      for j := 1 to min(scrW div 2, 100) do
        board[j, i] := Ord((i = 1) or (j = 1) or (i = min(scrH - 1, 100)) or
          (j = min(scrW div 2, 100)));
    {Create food}
    for i := 1 to foodCnt do
      board[random(min(scrW div 2, 100) - 2) + 2, random(min(scrH - 1, 100) - 2) + 2] := 3;
    {Initialize snake}
    sBody[1].x := min(scrW div 4, 100) - 2;
    sBody[1].y := min(scrH - 1, 100) div 2;
    sBody[2].x := min(scrW div 4, 100) - 1;
    sBody[2].y := min(scrH - 1, 100) div 2;
    sBody[3].x := min(scrW div 4, 100);
    sBody[3].y := min(scrH - 1, 100) div 2;
    gotoxy(1, 1);
    {Initial rendering}
    for i := 1 to min(scrH - 1, 100) do
    begin
      l := board[1, i];
      k := 1;
      for j := 2 to min(scrW div 2, 100) do
      begin
        if (board[j, i] <> l) then
        begin
          case l of
            0: txtB(black);
            1: txtB(LightGray);
            2: txtB(LightBlue);
            3: txtB(LightRed);
          end;
          Write('': (j - k) * 2);
          k := j;
          l := board[j, i];
        end;
      end;
      case l of
        0: txtB(black);
        1: txtB(LightGray);
        2: txtB(LightBlue);
        3: txtB(LightRed);
      end;
      Write('': (j - k + 1) * 2);
      {Only writeln if the play area is smaller than window size}
      {or else console will auto advance to next line}
      if (scrW > 201) then
        writeln;
    end;
    {Draw keyboard hints}
    gotoxy(1, scrH);
    txtB(Yellow);
    ClrEol();
    printButton(1, scrH, 2, 1, 'UP', 2);
    printButton(4, scrH, 4, 1, 'DOWN', 2);
    printButton(9, scrH, 4, 1, 'LEFT', 2);
    printButton(14, scrH, 5, 1, 'RIGHT', 2);
    {Main game loop}
    repeat
      {Render loop}
      repeat
        {Update snake}
        if ((d = 1) and (board[sbody[score].x + 1, sbody[score].y] = 3)) or
          ((d = 2) and (board[sbody[score].x, sbody[score].y + 1] = 3)) or
          ((d = 3) and (board[sbody[score].x - 1, sbody[score].y] = 3)) or
          ((d = 4) and (board[sbody[score].x, sbody[score].y - 1] = 3)) then
        begin
          {Hit food}
          score := score + 1;
          sbody[score] := sbody[score - 1];
          repeat
            r1 := random(min(scrH - 1, 100) - 2) + 2;
            r2 := random(min(scrW div 2, 100) - 2) + 2;
          until board[r2, r1] = 0;
          board[r2, r1] := 3;
          gotoxy(r2 * 2 - 1, r1);
          txtB(LightRed);
          Write('': 2);
        end
        else if ((d = 1) and (board[sbody[score].x + 1, sbody[score].y] = 2)) or
          ((d = 2) and (board[sbody[score].x, sbody[score].y + 1] = 2)) or
          ((d = 3) and (board[sbody[score].x - 1, sbody[score].y] = 2)) or
          ((d = 4) and (board[sbody[score].x, sbody[score].y - 1] = 2)) then
        begin
          {Hit snake body}
          dead := True;
        end
        else if ((d = 1) and (board[sbody[score].x + 1, sbody[score].y] = 1)) or
          ((d = 2) and (board[sbody[score].x, sbody[score].y + 1] = 1)) or
          ((d = 3) and (board[sbody[score].x - 1, sbody[score].y] = 1)) or
          ((d = 4) and (board[sbody[score].x, sbody[score].y - 1] = 1)) then
        begin
          {Hit wall}
          dead := True;
        end
        else
        begin
          {Hit nothing}
          board[sbody[1].x, sbody[1].y] := 0;
          gotoxy(sbody[1].x * 2 - 1, sbody[1].y);
          txtB(Black);
          Write('': 2);
          for i := 2 to score do
            sbody[i - 1] := sbody[i];
        end;
        {Move snake}
        if (d = 1) then
          sbody[score].x := sbody[score].x + 1
        else if (d = 2) then
          sbody[score].y := sbody[score].y + 1
        else if (d = 3) then
          sbody[score].x := sbody[score].x - 1
        else if (d = 4) then
          sbody[score].y := sbody[score].y - 1;
        board[sbody[score].x, sbody[score].y] := 2;
        {Draw moved parts}
        gotoxy(sbody[score-1].x * 2 - 1, sbody[score-1].y);
        txtB(LightBlue);
        Write('': 2);
        gotoxy(sbody[score].x * 2 - 1, sbody[score].y);
        txtB(Blue);
        Write('': 2);

        {Render text at the bottom of the screen}
        txtB(LightCyan);
        txtC(Black);
        gotoxy(scrW div 2 - length(' Score:  ' + IntToStr(score)) div 2, scrH);
        Write(' Score: ', score, ' ');

        {Wait for a short time before next frame}
        {Try to compensate for the time used above by shortening wait time}
        repeat
          delay(1);
        until TimeStampToMSecS(DateTimeToTimeStamp(now)) - ts > ctDelay;
        ts := TimeStampToMSecS(DateTimeToTimeStamp(now));
        {Repeats updating and rendering until key pressed or player dead}
      until keypressed or dead;
      if (not dead) then
      begin
        {Handle key press}
        c := readkey;
        if (c = #0) then
          c := readkey;
        if (c = #77) and (d <> 3) then
          d := 1
        else if (c = #80) and (d <> 4) then
          d := 2
        else if (c = #75) and (d <> 1) then
          d := 3
        else if (c = #72) and (d <> 2) then
          d := 4
        else if (c = #27) then
        begin
          {Pause key}
          txtB(Cyan);
          txtC(White);
          gotoxy(1, scrH div 2 - 2);
          ClrEol();
          gotoxy(1, scrH div 2 - 1);
          ClrEol();
          gotoxy(1, scrH div 2);
          Write('     Paused');
          ClrEol();
          gotoxy(1, scrH div 2 + 1);
          ClrEol();
          gotoxy(1, scrH div 2 + 2);
          ClrEol();
          choice := 1;
          {Wait for user input}
          {Basically hangs process with this loop to pause game}
          repeat
            printButton(scrW - 20, scrH div 2 - 1, 8, 0, 'Resume', choice = 1);
            printButton(scrW - 10, scrH div 2 - 1, 8, 0, 'Quit', choice = 2);
            c := readkey;
            if (c = #0) then
              c := readkey;
            if (c = #77) then
            begin
              choice := choice + 1;
              if (choice > 2) then
                choice := 2;
            end
            else if (c = #75) then
            begin
              choice := choice - 1;
              if (choice < 1) then
                choice := 1;
            end
            else if (c = #27) then
            begin
              choice := 1;
              c := #13;
            end;
          until c = #13;
          if (choice = 2) then
            dead := True
          else
          begin
            {Unpause game, redraw affected area}
            gotoxy(1, scrH div 2 - 2);
            txtB(Black);
            write('':scrW-1);
            write('':scrW-1);
            write('':scrW-1);
            write('':scrW-1);
            write('':scrW-1);
            gotoxy(1, scrH div 2 - 2);
            for i := scrH div 2 - 2 to min(scrH div 2 + 2, 100) do
            begin
              l := board[1, i];
              k := 1;
              for j := 2 to min(scrW div 2, 100) do
              begin
                if (board[j, i] <> l) then
                begin
                  case l of
                    0: txtB(black);
                    1: txtB(LightGray);
                    2: txtB(LightBlue);
                    3: txtB(LightRed);
                  end;
                  Write('': (j - k) * 2);
                  k := j;
                  l := board[j, i];
                end;
              end;
              case l of
                0: txtB(black);
                1: txtB(LightGray);
                2: txtB(LightBlue);
                3: txtB(LightRed);
              end;
              Write('': (j - k + 1) * 2);
              {Only writeln if the play area is smaller than window size}
              {or else console will auto advance to next line}
              if (scrW > 201) then
                writeln;
            end;
          end;
        end;

      end;
    until dead;
    delay(500);
  end;