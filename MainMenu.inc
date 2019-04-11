  procedure printTitle();
  var
    bg: array[1..18] of string;
    i, j, k: integer;
    l:  char;
  begin
    i := 0;
    i := i + 1;
    bg[i] :=
      '           rrrrrrrrrrrrrr                                                 rrrrrrrr                                           ';
    i := i + 1;
    bg[i] :=
      '         rrrrrrrrrrrrrrrrr                                                rrrrrrrr                                           ';
    i := i + 1;
    bg[i] :=
      '        rrrrrrrr   rrrrrrr                                                rrrrrrr                                            ';
    i := i + 1;
    bg[i] :=
      '        rrrrrrr    rrrrrrr    rrrrrrrrr rrrrrrrr       rrrrrrrrrrrr      rrrrrrrr   rrrrrr    rrrrrrrrrrrrrr                 ';
    i := i + 1;
    bg[i] :=
      '       rrrrrrrr   rrrrrrr     rrrrrrrrrrrrrrrrrr    rrrrrrrrrrrrrrrrr    rrrrrrrr rrrrrrr    rrrrrrrrrrrrrrrr                ';
    i := i + 1;
    bg[i] :=
      '       rrrrrrrrrr            rrrrrrrr   rrrrrrrr   rrrrrrr   rrrrrrrr    rrrrrrrr rrrrrr    rrrrrrr   rrrrrrr                ';
    i := i + 1;
    bg[i] :=
      '       rrrrrrrrrrrr    wwwwwwrrrrrrrrwwwrrrrrrrrwwwrrrrrrrwwwrrrrrrrrwwwrrrrrrrrrrrrrrrwwwwrrrrrrrwwwwrrrrrrrwwwwwwwwwwwwwwww';
    i := i + 1;
    bg[i] :=
      '         rrrrrrrrrrrrr wwwwwwrrrrrrrrwwwrrrrrrrwwwwrrrrrrrwwwrrrrrrrwwwwrrrrrrrrrrrrrrwwwwrrrrrrrrwwwwrrrrrrrwwwwwwwwwwwwwwww';
    i := i + 1;
    bg[i] :=
      '           rrrrrrrrrrrrr    rrrrrrrr   rrrrrrrr           rrrrrrrrrr    rrrrrrrrrrrrr     rrrrrrrrrrrrrrrrrrr                ';
    i := i + 1;
    bg[i] :=
      '             rrrrrrrrrrr    rrrrrrrr   rrrrrrrr     rrrrrrrrrrrrrrrr   rrrrrrrrrrrrrr     rrrrrrrrrrrrrrrrrr                 ';
    i := i + 1;
    bg[i] :=
      '      rrrrrrr   rrrrrrrr   rrrrrrrrr  rrrrrrrrr   rrrrrrrr rrrrrrrr    rrrrrrrrrrrrrrr    rrrrrrr                            ';
    i := i + 1;
    bg[i] :=
      '     rrrrrrrr   rrrrrrrr   rrrrrrrr   rrrrrrrr   rrrrrrr    rrrrrrr   rrrrrrrr rrrrrrr   rrrrrrr    rrrrrrrr                 ';
    i := i + 1;
    bg[i] :=
      '     rrrrrrr    rrrrrrrr   rrrrrrrr   rrrrrrrr   rrrrrrr   rrrrrrrr   rrrrrrrr  rrrrrr   rrrrrrr    rrrrrrr                  ';
    i := i + 1;
    bg[i] :=
      '     rrrrrrr   rrrrrrrr   rrrrrrrrr   rrrrrrrr   rrrrrrr   rrrrrrr    rrrrrrr   rrrrrr   rrrrrrr   rrrrrrr                   ';
    i := i + 1;
    bg[i] :=
      'wwwwwrrrrrrrrrrrrrrrrrwwwwrrrrrrrrwwwrrrrrrrrwwwrrrrrrrrrrrrrrrrrrwwwrrrrrrrrwwwrrrrrrwwwrrrrrrrrrrrrrrrrwwww                ';
    i := i + 1;
    bg[i] :=
      'wwwwwwrrrrrrrrrrrrrrwwwwwwrrrrrrrrwwwrrrrrrrrwwwwrrrrrrrrwrrrrrrrwwwwrrrrrrrwwwrrrrrrrrwwwwrrrrrrrrrrrrwwwwww                ';
    i := i + 1;
    bg[i] :=
      'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww                ';
    i := i + 1;
    bg[i] :=
      'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww                ';


    txtB(blue);
    cursoroff();
    gotoxy(1, 3);
    for i := 1 to min(scrH, 18) do
    begin
      l := bg[i, 1];
      k := 1;
      for j := 2 to min(scrW, 125) do
      begin
        if (bg[i, j] <> l) then
        begin
          if (l = ' ') then
          begin
            gotoxy(j, whereY);
          end
          else
          begin
            case l of
              'b': txtB(blue);
              'l': txtB(lightBlue);
              'w': txtB(white);
              'r': txtB(LightGreen);
            end;
            Write('': j - k);
          end;
          k := j;
          l := bg[i, j];
        end;
      end;
      if (l = ' ') then
      begin
        gotoxy(1, WhereY + 1);
      end
      else
      begin
        case l of
          'b': txtB(blue);
          'l': txtB(lightBlue);
          'w': txtB(white);
          'r': txtB(LightGreen);
        end;
        Write('': j - k);
      end;
    end;
  end;

  procedure printBG();
  var
    bg: array[1..80] of string;
    i, j, k: integer;
    l:  char;
  begin
    i := 0;
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllblllllllblbllllllllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllbllllllblllllllllllllllllllllllllbllllblllllblllllllllllllllllllllllllbllllblllllllblblllllllllllllblbllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllblbllllllllllllllllllllllllllllblllllllllllllllllllllllllllllllllllblllllllllllllllllllllllllbllllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllllllllllllbllllblblllllllllllllllllllllllllllllblblllllbllllllllllblblllllllllllllllblllllllllllllbblbllblll';
    i := i + 1;
    bg[i] :=
      'lllllllllllllllllbllllllllllllblbllllbllllblblbllllllllllllllllllllbllllblllllbllllbllllllllllllllbllllllllllllllllllllllllll';
    i := i + 1;
    bg[i] :=
      'llbllllllllbllllbllllllllbllllblllbllblblllllbllllllllbllblllblllllbllblllllllbllblllllbllllblllllllllllllllllllllllllbllblll';
    i := i + 1;
    bg[i] :=
      'blbllllblbllllllllllllbllllbllbllblllbllbllllllblbllllllblllllblbblllllllllbllblblblllllllllllllllbllllllllllllblllblllllbllb';
    i := i + 1;
    bg[i] :=
      'lllllllblllllllllllllblblbllllblllllllllblblbllblllllllllllblllblllbllllllllblllblbllblblllbllllblbllbllbllllblblllblllllblll';
    i := i + 1;
    bg[i] :=
      'llbllblllllbllbllllbllllbllllblblllllllllllllblllllblblllllbllllllblblblllllblllllbllbllllllllblbllbllllbblllbllblblbllllllll';
    i := i + 1;
    bg[i] :=
      'lllblblblbllllllllblllllblllbblbllllllllblbllblbllblllbllllblllbllblblllllblbllllllbllllllblllllbllblbblbllbllllllllblbllbbll';
    i := i + 1;
    bg[i] :=
      'bllllllllbllblblblblblllllblllblbllblblllllllllblllllbllbllllbbllllbbllblblllllllbllblllblblblblllbllbllllblllllblllblbllllll';
    i := i + 1;
    bg[i] :=
      'bllbllblbllllbllllllbllllllllblbllllblllbllllllblbbllllblbllllblllllblblbllllllllblblblllblllbllllllllblbblbllllllbllbllllblb';
    i := i + 1;
    bg[i] :=
      'blbllllllblbllllllblbblblblllllbllllblblblbbllllbllbllllblblbllbllllllllbllllbllblllblllbllblllllbllblblllbblblblblbllbllbllb';
    i := i + 1;
    bg[i] :=
      'bllblllblllbllbllbblbblllllblllblllbllllblblblblblllbllbblbbllllbllbllllbbllblblblblblblllblllbllblllllbblblblblbllllblllllbb';
    i := i + 1;
    bg[i] :=
      'lbllbllbllblblbllbllblbllblblllbllllblllbllbllllllbblblbllblblllllllbllllbblbllbllblblllbllllllblblblblbllblllblbblblblllblbl';
    i := i + 1;
    bg[i] :=
      'lbllbllbllblblblblbblblbllbllllblblblbbllblbllllblblbbllblbblblblblbllbblbllblblllblllbblbllbllblbblblblllblblbblblblblblbblb';
    i := i + 1;
    bg[i] :=
      'llblblbllbbblblblblblbllblblblblllblblbblbllbllbllblblblbblbllllbblblbllblbllbllblbblbblbllbllllbllblbblblblbllblblbbbblblbll';
    i := i + 1;
    bg[i] :=
      'bbbbllbllblblblblbllbblbbbblblbllblblbllblblblblllbllllbllbllblblblbllbllbllbllblblbbllblblbbbllblbllblblbllbllbblbblblblbblb';
    i := i + 1;
    bg[i] :=
      'blblblblblbblbbblllbblbllblbblbblblblblblblblbllblblllbbblblbblbllbllblblbllbblblbblbblllllblblblblllbblblblbllblbllblblbblbb';
    i := i + 1;
    bg[i] :=
      'lblllblbblbllbbbllbblbllbllblbllblbblblbblblbbblbbllblbblbllblbbblblllbblblblbbblbllblllblbblbblblbblbblbbbbbblblblbblbbblbbl';
    i := i + 1;
    bg[i] :=
      'bbllblbllbllbbbbbbbblbllbblblbbbbbbllbblblbbblbblblbbblblblbblbblbblblbbllblbbbbbblbblbllbbbbllblblblbblblblblblbbllblblblllb';
    i := i + 1;
    bg[i] :=
      'bbbbbbllblbblbblbblbblblbblbbbblblbllblbllbblbblbblbblblbblbblblbblbbblblblblblbblbblbllblbbbblblblbllbbbblbblblblbblblblblbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbllbblbblbbllblbblblbblblbblblbblblbblblbbbbblbllblbblblblbbbbbbblbblbbbbblblllbbllbblblllblbblbbbblbbbbllblbbblblblbb';
    i := i + 1;
    bg[i] :=
      'bblblbbblblbbblbbbblbbblblblbblbbbbblblblllblbllbblbblbbbbblbbbbbbbbblblblbbllbbbbbblbblbbbblbblbbblbblblbbbbbblbbblbbbblblbb';
    i := i + 1;
    bg[i] :=
      'lbblblblblbbbbblbbblbbbbbbbbbbllblbbbbblblblbbblbbbbblblblbblblllblbblblbbbbbllblbbblbblblbblbbblbbllblblbblblblblbbbblbbbbbb';
    i := i + 1;
    bg[i] :=
      'lblblblblbbbblbblbblbbbblbbbbblblbbblblbbbbbbbbbbbbblblblbblblbblbbbblblbblbllbbbblbbbbblbbbblbblbblbbbblbbblblbbbblbbbblblbb';
    i := i + 1;
    bg[i] :=
      'bbblbblblblbbblblbblbbbbbbblbbblbblblbbbbbbbbbbbbbbblbblbblblblbbbbblbblblbbbbbbbbblbbbbbbbblbblblblblbblbbbbbblbbblbbbblblbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbblblblbbbbblbllbbblbbbblbbblblbbbbblbbbbbbbblblblbbbbbbbbblbbbbblbbbbbblbblblbbbbblbbbbblbbbbblbbbbbbbbbblbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbblbbbbbblblblbbbbbbbbbbbblbbbbblblbblbbbbbbbbbbblblbbbbbbbbbbbbbbbbblbblbbbbbblbbbbbbbbbbbbbbbbbbblbblbbbbblbbbblbbblbb';
    i := i + 1;
    bg[i] :=
      'bbbbblbbbbbbblbblbbbbbbbbbblblblblbbblbblbbbbbbbbbbbblbbbbbbbblblbbbblblbbbbbblblbbbblblbbbbllbbbbbbbbbbblbblbbllblbbbblbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbblblblbbbbbbbbbbbbbbbbblbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblbbbbbbbbbbblbbbbblbbbbbbbbbbbbbbbbblblbbbblbbblbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblbbbbbbbblbbbbbbbbbbbbbbbbblbbbbbbbbbbbblbbbbbbbbbbbbbbbbbblbbbbbbblbbbbbbbbbblbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbblbblbbbbbbblbbbbbbbbbbbbbblblbbbbbbblbbbbbbbbblbbbbblbbbbbbblbblbbbblbbbbbblblblbbbbbblbbbblbblbblbbbbblbblbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbblbbbbbbbbbbbbbbbbbbbbbbblbbbbbbblblbbbbbbblbbbblbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblblbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblbbbbbbbblbbbbbbbbbbbbbblbbbbbbblbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblbbbbbbbbbbbbbbbbbbbblbbbbbblbbbbbbbbblbbbbbbbbbbbbblbbbbbbbbbbbbbbbbbbbbbblblbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
    i := i + 1;
    bg[i] :=
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';


    txtB(blue);
    clrscr();
    cursoroff();
    for i := 1 to min(scrH, 80) do
    begin
      l := bg[i, 1];
      k := 1;
      for j := 2 to min(scrW, 125) do
      begin
        if (bg[i, j] <> l) then
        begin
          case l of
            'b': txtB(blue);
            'l': txtB(lightBlue);
            'w': txtB(white);
            'r': txtB(LightGreen);
          end;
          Write('': j - k);
          k := j;
          l := bg[i, j];
        end;
      end;
      case l of
        'b': txtB(blue);
        'l': txtB(lightBlue);
        'w': txtB(white);
        'r': txtB(LightGreen);
      end;
      Write('': j - k);
    end;
  end;

  procedure printButton(x, y, w, h: integer; s: string; selected: integer);
  var
    i: integer;
  begin
    if (selected = 1) then
    begin
      txtB(Yellow);
      txtC(LightMagenta);
    end
    else if (selected = 0) then
    begin
      txtB(Magenta);
      txtC(LightCyan);
    end
    else if (selected = 2) then
    begin
      txtB(Red);
      txtC(White);
    end;
    gotoxy(x, y);
    if (h = 0) then
    begin
      if (w = 0) then
      begin
        Write('': 4 + length(s));
        gotoxy(x, y + 1);
        if (selected = 1) then
          Write('> ', s, ' <')
        else
          Write('  ', s, '  ');
        gotoxy(x, y + 2);
        Write('': 4 + length(s));
      end
      else
      begin
        Write('': w);
        gotoxy(x, y + 1);
        if (selected = 1) then
          Write('>', '': (w - length(s)) div 2 - 1, s, '': (w - length(s) + 1) div
            2 - 1, '<')
        else
          Write('': (w - length(s)) div 2, s, '': (w - length(s) + 1) div 2);
        gotoxy(x, y + 2);
        Write('': w);
      end;
    end
    else
    begin
      if (w = 0) then
      begin
        for i := 1 to (h - 1) div 2 do
        begin
          gotoxy(x, y - 1 + i);
          Write('': 4 + length(s));
        end;
        gotoxy(x, y + (h - 1) div 2);
        if (selected = 1) then
          Write('> ', s, ' <')
        else
          Write('  ', s, '  ');
        for i := 1 to (h) div 2 do
        begin
          gotoxy(x, y + (h - 1) div 2 + i);
          Write('': 4 + length(s));
        end;
      end
      else
      begin
        for i := 1 to (h - 1) div 2 do
        begin
          gotoxy(x, y - 1 + i);
          Write('': w);
        end;
        gotoxy(x, y + (h - 1) div 2);
        if (selected = 1) then
          Write('>', '': (w - length(s)) div 2 - 1, s, '': (w - length(s) + 1) div
            2 - 1, '<')
        else
          Write('': (w - length(s)) div 2, s, '': (w - length(s) + 1) div 2);
        for i := 1 to (h) div 2 do
        begin
          gotoxy(x, y + (h - 1) div 2 + i);
          Write('': w);
        end;
      end;
    end;
  end;

  procedure printButton(x, y, w, h: integer; s: string; selected: boolean);
  begin
    printbutton(x, y, w, h, s, Ord(selected));
  end;

  function startScreen(): integer;
  var
    choice: integer;
    c: char;
  begin
    clrscr();
    printBG();
    printTitle();
    printButton(1, scrH, 2, 1, 'UP', 2);
    printButton(4, scrH, 4, 1, 'DOWN', 2);
    printButton(9, scrH, 5, 1, 'ENTER', 2);
    choice := 1;
    repeat
      printButton(5, scrH - 30, scrW - 10, 0, 'CLASSIC', choice = 1);
      printButton(5, scrH - 20, scrW - 10, 0, 'ADVENTURE', choice = 2);
      printButton(5, scrH - 10, scrW - 10, 0, 'BATTLE', choice = 3);
      c := readkey;
      if (c = #0) then
        c := readkey;
      if (c = #72) then  //up
      begin
        choice := choice - 1;
        if (choice < 1) then
          choice := 1;
      end
      else if (c = #80) then //down
      begin
        choice := choice + 1;
        if (choice > 3) then
          choice := 3;
      end;
    until c = #13;
    startScreen := choice;
  end;
