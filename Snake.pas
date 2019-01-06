program Snake;

uses
  crt;

var
  x, y, a, b, l, k, fx, fy, z, i, j, boxx, boxy, score: integer;
  c: char;

  function outofbound(p, q: integer): boolean;
  begin
    outofbound := False;
    if q <= 1 then
      outofbound := True;
    if q >= 27 then
      outofbound := True;
    if p <= 1 then
      outofbound := True;
    if p >= 70 then
      outofbound := True;
  end;

  procedure gameover;
  begin
    if outofbound(x, y) then
    begin
      writeln('out!!!');
      delay(10000);
    end;
  end;

  procedure control;
  begin

    if Ord(c) = 115 then
    begin
      for i := 1 to l do
      begin
        gotoxy(x - a * l, y - b * l);
        Write(' ');
      end;
      if (b - 0) <> -1 then
      begin
        a := 0;
        b := 1;
      end;
    end

    else if Ord(c) = 97 then
    begin
      for i := 1 to l do
      begin
        gotoxy(x - a * l, y - b * l);
        Write(' ');
      end;
      if (a - 0) <> 1 then
      begin
        a := -1;
        b := 0;
      end;
    end

    else if Ord(c) = 100 then
    begin
      for i := 1 to l do
      begin
        gotoxy(x - a * l, y - b * l);
        Write(' ');
      end;
      if (a - 0) <> -1 then
      begin
        a := 1;
        b := 0;
      end;
    end

    else if Ord(c) = 119 then
    begin
      for i := 1 to l do
      begin
        gotoxy(x - a * l, y - b * l);
        Write(' ');
      end;
      if (b - 0) <> 1 then
      begin
        a := 0;
        b := -1;
      end;
    end;

  end;


begin
  randomize;
  z := 150;
  cursoroff;
  x := 5;
  y := 4;
  a := 1;
  b := 0;
  l := 1;




  boxx := 0;
  boxy := 0;
  for i := 1 to 70 do

    Write('+');
  writeln('+');


  for j := 1 to 24 do
    writeln('+', '+': 70);


  for i := 1 to 70 do
    Write('+');
  writeln('+');

  writeln;

  fy := random(20) + 2;
  fx := random(65) + 2;
  gotoxy(fx, fy);
  Write('$');




  repeat
    repeat

      gameover;
      if (x = fx) and (y = fy) then
      begin
        gotoxy(31, 1);
        Write('score:', score);
        fy := random(20) + 3;
        fx := random(65) + 3;
        gotoxy(fx, fy);
        Write('$');
        l := l + 1;
        z := z - 5;
        score := score + 1;
      end;

      delay(z);
      gotoxy(x, y);
      Write('*');
      gotoxy(x - a * l, y - b * l);
      Write(' ');

      x := x + a;
      y := y + b;
    until keypressed;
    c := readkey;

    control;


  until False;

end.
