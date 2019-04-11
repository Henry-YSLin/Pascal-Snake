{
  TODO:
  Enhance AI
  Large screen render error
}

const
  bSize = 100;
  pCnt  = 10;
type
  player = record
    x, y, vx, vy: integer;
    score: longint;
    color: byte;
    dead:  boolean;
    turn:  integer;
  end;

  procedure battleMode();
  var
    i, j, l, t, k, camX, camY, r1, r2: integer;
    ts: real;
    map: array[1..bSize, 1..bSize] of integer;
    buffer: array[1..100, 1..100] of integer;
    //buffer before writing to screen to only write diffs
    snakes: array[1..pCnt] of player;         //the first snake is always the player
    c: char;
    choice: integer;
    gtxy: boolean;
  begin
    txtB(Black);
    ClrScr();
    for i := 1 to pCnt do
    begin
      repeat
        r1 := random(bSize - 2) + 2;
        r2 := random(bSize - 2) + 2;
      until map[r1, r2] = 0;
      snakes[i].x := r1;
      snakes[i].y := r2;
      snakes[i].dead := False;
      snakes[i].score := 1;
      snakes[i].turn := 0;
      map[r1, r2] := i + pCnt;
      if (snakes[i].x > bSize div 2) then
        snakes[i].vx := -1
      else
        snakes[i].vx := 1;
      snakes[i].vy := 0;
      snakes[i].color := i mod 7 + 9;
    end;
    ts := TimeStampToMSecS(DateTimeToTimeStamp(now));
    for i := 1 to bSize do
      for j := 1 to bSize do
        map[j, i] := Ord((i = 1) or (j = 1) or (i = bSize) or (j = bSize)) * -1;
    for i := 1 to 100 do
      for j := 1 to 100 do
        buffer[i, j] := 0;
    gotoxy(1, scrH);
    txtB(Yellow);
    ClrEol();
    printButton(1, scrH, 2, 1, 'UP', 2);
    printButton(4, scrH, 4, 1, 'DOWN', 2);
    printButton(9, scrH, 4, 1, 'LEFT', 2);
    printButton(14, scrH, 5, 1, 'RIGHT', 2);
    repeat
      repeat
        for i := 1 to pCnt do
        begin
          if snakes[i].dead then
            continue;
          snakes[i].x := snakes[i].x + snakes[i].vx;
          snakes[i].y := snakes[i].y + snakes[i].vy;
          if (map[snakes[i].x, snakes[i].y] = 0) then
          begin
            snakes[i].score := snakes[i].score + 1;
            map[snakes[i].x, snakes[i].y] := i;
            if (i = 1) then
              continue;
            snakes[i].turn := snakes[i].turn + 1;
            r1 := 1;
            while (snakes[i].x + snakes[i].vx * r1 > 0) and
              (snakes[i].y + snakes[i].vy * r1 > 0) and
              (snakes[i].x + snakes[i].vx * r1 <= bSize) and
              (snakes[i].y + snakes[i].vy * r1 <= bSize) and
              (map[snakes[i].x + snakes[i].vx * r1, snakes[i].y +
                snakes[i].vy * r1] = 0) do
              r1 := r1 + 1;
            if (r1=1) and (random((r1 - 1) * 10 + 1) = 0) or ((snakes[i].turn > 100000) and
              (random(20) = 1)) then
            begin
              if (snakes[i].vx = 0) then
              begin
                snakes[i].vy := 0;
                r1 := 1;
                while (snakes[i].x - r1 > 0) and
                  (map[snakes[i].x - r1, snakes[i].y] = 0) do
                  r1 := r1 + 1;
                r2 := 1;
                while (snakes[i].x + r2 <= bSize) and
                  (map[snakes[i].x + r2, snakes[i].y] = 0) do
                  r2 := r2 + 1;
                if (r1 > 1) or (r2 > 1) then
                  if (r1 > r2) then
                    snakes[i].vx := -1
                  else
                    snakes[i].vx := 1;
              end
              else
              begin
                snakes[i].vx := 0;
                r1 := 1;
                while (snakes[i].y - r1 > 0) and
                  (map[snakes[i].x, snakes[i].y - r1] = 0) do
                  r1 := r1 + 1;
                r2 := 1;
                while (snakes[i].y + r2 <= bSize) and
                  (map[snakes[i].x, snakes[i].y + r2] = 0) do
                  r2 := r2 + 1;
                if (r1 > 1) or (r2 > 1) then
                  if (r1 > r2) then
                    snakes[i].vy := -1
                  else
                    snakes[i].vy := 1;
              end;
            end;
          end
          else
          begin
            snakes[i].dead := True;
            if (map[snakes[i].x, snakes[i].y] <> -1) then
              snakes[map[snakes[i].x, snakes[i].y]].score :=
                snakes[map[snakes[i].x, snakes[i].y]].score + snakes[i].score;
              //TODO clear snake body
              for j := 1 to bSize do
                for k := 1 to bSize do
                  if map[j, k] = i then
                    map[j, k] := 0;
          end;
        end;
        camX := snakes[1].x - min(scrW div 2, 100) div 2;
        camY := snakes[1].y - min(scrH - 1, 100) div 2;
        //camX := 1;
        //camY := 2;
        gtxy := True;
        for i := camY to camY + min(scrH - 1, 100) - 1 do
        begin
          k := camX;
          if (gtxy) then
          begin
            gotoxy(1, i - camY + 1);
            gtxy := False;
          end;
          if (k < 1) or (i < 1) or (k > bSize) or (i > bSize) then
          begin
            if (buffer[1, i - camY + 1] <> 0) then
            begin
              l := 0;
              buffer[1, i - camY + 1] := 0;
            end
            else
            begin
              l := -2;
            end;
          end
          else if (buffer[1, i - camY + 1] <> map[k, i]) then
          begin
            l := map[k, i];
            buffer[1, i - camY + 1] := map[k, i];
          end
          else
          begin
            l := -2;
          end;
          for j := camX + 1 to camX + min(scrW div 2, 100) - 1 do
          begin
            if (j < 1) or (i < 1) or (j > bSize) or (i > bSize) then
            begin
              if (buffer[j - camX + 1, i - camY + 1] <> 0) then
              begin
                t := 0;
                buffer[j - camX + 1, i - camY + 1] := 0;
              end
              else
              begin
                t := -2;
              end;
            end
            else if (buffer[j - camX + 1, i - camY + 1] <> map[j, i]) then
            begin
              t := map[j, i];
              buffer[j - camX + 1, i - camY + 1] := map[j, i];
            end
            else
            begin
              t := -2;
            end;
            if (t <> l) then
            begin
              if (gtxy) then
              begin
                gotoxy((k - camX + 1) * 2 - 1, i - camY + 1);
                gtxy := False;
              end;
              if (l = -2) then
                gtxy := True
              else if (l = -1) then
                txtB(LightGray)
              else if (l = 0) then
                txtB(black)
              else
                txtB(snakes[map[k, i]].color);
              if (l <> -2) then
                Write('': (j - k) * 2);
              k := j;
              l := t;
            end;
          end;
          if (gtxy) then
          begin
            gotoxy((k - camX + 1) * 2 - 1, i - camY + 1);
            gtxy := False;
          end;
          l := t;
          if (l = -2) then
            gtxy := True
          else if (l = -1) then
            txtB(LightGray)
          else if (l = 0) then
            txtB(black)
          else
            txtB(snakes[map[k, i]].color);
          if (l <> -2) then
            Write('': (j - k + 1) * 2);
        end;

        txtB(LightCyan);
        txtC(Black);
        r1 := 0;
        for i := 1 to pCnt do
          r1 := r1 + Ord(not snakes[i].dead);
        gotoxy(scrW div 2 - length(' Score: ' + IntToStr(snakes[1].score) +
          ' ' + IntToStr(snakes[1].x) + ',' + IntToStr(Snakes[1].y) +
          ' ' + IntToStr(r1) + ' ') div 2, scrH);
        Write(' Score: ', snakes[1].score, ' ', snakes[1].x, ',',
          Snakes[1].y, ' ', r1, ' ');
        repeat
          delay(1);
        until TimeStampToMSecS(DateTimeToTimeStamp(now)) - ts > 50;
        ts := TimeStampToMSecS(DateTimeToTimeStamp(now));
      until keypressed or snakes[1].dead;
      if (not snakes[1].dead) then
      begin
        c := readkey;
        if (c = #0) then
          c := readkey;
        if (c = #77) and (snakes[1].vx <> -1) then
        begin
          snakes[1].vx := 1;
          snakes[1].vy := 0;
        end
        else if (c = #80) and (snakes[1].vy <> -1) then
        begin
          snakes[1].vx := 0;
          snakes[1].vy := 1;
        end
        else if (c = #75) and (snakes[1].vx <> 1) then
        begin
          snakes[1].vx := -1;
          snakes[1].vy := 0;
        end
        else if (c = #72) and (snakes[1].vy <> 1) then
        begin
          snakes[1].vx := 0;
          snakes[1].vy := -1;
        end
        else if (c = #27) then
        begin
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
            snakes[1].dead := True
          else
          begin
            gotoxy(1, scrH div 2 - 2);
            txtB(Black);
            write('':scrW-1);
            write('':scrW-1);
            write('':scrW-1);
            write('':scrW-1);
            write('':scrW-1);
            for i := 1 to scrW div 2 do
              for j := scrH div 2 - 2 to scrH div 2 + 2 do
                if (i < 100) and (j < 100) then
                  buffer[i, j] := -2;
          end;
        end;
      end;
    until snakes[1].dead;
    delay(500);

  end;