program Snake;

uses
  crt,
  Math,
  SysUtils;

{===== CRT Color Fix ======}
var
  tC, tB: byte;

  procedure txtC;
  begin
    textColor(tC);
  end;

  procedure txtC(c: byte);
  begin
    tC := c;
    textColor(c);
  end;

  procedure txtB(c: byte);
  begin
    if (c > 7) then
      textColor(-1)
    else
      textColor(tC);
    tB := c;
    textBackground(c);
  end;

  {====== Special characters const =======}
const
  l_shade = ' ';
  m_shade = ' ';
  d_shade = ' ';
  f_shade = ' ';

var
  scrW, scrH: integer;

  procedure measureScr;
  var
    t: integer;
  begin
    t := 0;
    scrW := 1;
    gotoxy(1, 1);
    while scrW > t do
    begin
      t := scrW;
      Write(' ');
      scrW := whereX;
    end;
    scrW := t + 1;
    t := 0;
    scrH := 1;
    gotoxy(1, 1);
    while scrH > t do
    begin
      t := scrH;
      writeln;
      scrH := whereY;
    end;
    scrH := scrH;
  end;

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

type
  point = record
    x: integer;
    y: integer;
  end;

  procedure classicMode();
  var
    i, j, l, k, d, r1, r2, choice: integer;
    ts: real;
    board: array[1..63, 1..79] of integer;  //1: wall, 2: snake, 3: food
    sBody: array[1..63 * 79] of point;
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
    for i := 1 to min(scrH - 1, 79) do
      for j := 1 to min(scrW div 2, 63) do
        board[j, i] := Ord((i = 1) or (j = 1) or (i = min(scrH - 1, 79)) or
          (j = min(scrW div 2, 63)));
    board[random(min(scrH - 1, 79) - 2) + 2, random(min(scrW div 2, 63) - 2) + 2] := 3;
    sBody[1].x := min(scrW div 4, 63) - 2;
    sBody[1].y := min(scrH - 1, 79) div 2;
    sBody[2].x := min(scrW div 4, 63) - 1;
    sBody[2].y := min(scrH - 1, 79) div 2;
    sBody[3].x := min(scrW div 4, 63);
    sBody[3].y := min(scrH - 1, 79) div 2;
    gotoxy(1, 1);
    for i := 1 to min(scrH - 1, 79) do
    begin
      l := board[1, i];
      k := 1;
      for j := 2 to min(scrW div 2, 63) do
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
      {if (scrW mod 2 <> 0) then
        writeln;}
    end;
    gotoxy(1, scrH);
    txtB(Yellow);
    ClrEol();
    printButton(1, scrH, 2, 1, 'UP', 2);
    printButton(4, scrH, 4, 1, 'DOWN', 2);
    printButton(9, scrH, 4, 1, 'LEFT', 2);
    printButton(14, scrH, 5, 1, 'RIGHT', 2);
    repeat
      repeat
        if ((d = 1) and (board[sbody[score].x + 1, sbody[score].y] = 3)) or
          ((d = 2) and (board[sbody[score].x, sbody[score].y + 1] = 3)) or
          ((d = 3) and (board[sbody[score].x - 1, sbody[score].y] = 3)) or
          ((d = 4) and (board[sbody[score].x, sbody[score].y - 1] = 3)) then
        begin
          score := score + 1;
          sbody[score] := sbody[score - 1];
          repeat
            r1 := random(min(scrH - 1, 79) - 2) + 2;
            r2 := random(min(scrW div 2, 63) - 2) + 2;
          until board[r1, r2] = 0;
          board[r1, r2] := 3;
          gotoxy(r1 * 2 - 1, r2);
          txtB(LightRed);
          Write('': 2);
        end
        else if ((d = 1) and (board[sbody[score].x + 1, sbody[score].y] = 2)) or
          ((d = 2) and (board[sbody[score].x, sbody[score].y + 1] = 2)) or
          ((d = 3) and (board[sbody[score].x - 1, sbody[score].y] = 2)) or
          ((d = 4) and (board[sbody[score].x, sbody[score].y - 1] = 2)) then
        begin
          dead := True;
        end
        else if ((d = 1) and (board[sbody[score].x + 1, sbody[score].y] = 1)) or
          ((d = 2) and (board[sbody[score].x, sbody[score].y + 1] = 1)) or
          ((d = 3) and (board[sbody[score].x - 1, sbody[score].y] = 1)) or
          ((d = 4) and (board[sbody[score].x, sbody[score].y - 1] = 1)) then
        begin
          dead := True;
        end
        else
        begin
          board[sbody[1].x, sbody[1].y] := 0;
          gotoxy(sbody[1].x * 2 - 1, sbody[1].y);
          txtB(Black);
          Write('': 2);
          for i := 2 to score do
            sbody[i - 1] := sbody[i];
        end;
        if (d = 1) then
          sbody[score].x := sbody[score].x + 1
        else if (d = 2) then
          sbody[score].y := sbody[score].y + 1
        else if (d = 3) then
          sbody[score].x := sbody[score].x - 1
        else if (d = 4) then
          sbody[score].y := sbody[score].y - 1;
        board[sbody[score].x, sbody[score].y] := 2;
        gotoxy(sbody[score].x * 2 - 1, sbody[score].y);
        txtB(LightBlue);
        Write('': 2);

        txtB(LightCyan);
        txtC(Black);
        gotoxy(scrW div 2 - length(' Score:  ' + IntToStr(score)) div 2, scrH);
        Write(' Score: ', score, ' ');
        repeat
          delay(1);
        until TimeStampToMSecS(DateTimeToTimeStamp(now)) - ts > 50;
        ts := TimeStampToMSecS(DateTimeToTimeStamp(now));
      until keypressed or dead;
      if (not dead) then
      begin
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
            dead := True
          else
          begin
            gotoxy(1, scrH div 2 - 2);
            for i := scrH div 2 - 2 to min(scrH div 2 + 2, 79) do
            begin
              l := board[1, i];
              k := 1;
              for j := 2 to min(scrW div 2, 63) do
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
              {if (scrW mod 2 <> 0) then
                  writeln;}
            end;
          end;
        end;
      end;
    until dead;
  end;

const
  bSize = 60;
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
    buffer: array[1..63, 1..79] of integer;
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
    for i := 1 to 63 do
      for j := 1 to 79 do
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
            if (random(r1) = 0) or ((snakes[i].turn > 10) and (random(10) = 1)) then
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

            //TODO clear snake body
          end;
        end;
        camX := snakes[1].x - scrW div 4;
        camY := snakes[1].y - (scrH - 1) div 2;
        gtxy := True;
        for i := camY to camY + scrH - 2 do
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
          for j := camX + 1 to camX + scrW div 2 - 1 do
          begin
            if (j < 1) or (i < 1) or (j > bSize) or (i > bSize) then
            begin
              if (buffer[j - camX + 1, i - camY + 1] <> 0) then
              begin
                t := 0;
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
          r1 := r1 + ord(not snakes[i].dead);
        gotoxy(scrW div 2 - length(' Score: ' + IntToStr(snakes[1].score) +
          ' ' + IntToStr(snakes[1].x) + ',' + IntToStr(Snakes[1].y) + ' ' + IntToStr(r1) + ' ') div 2, scrH);
        Write(' Score: ', snakes[1].score, ' ', snakes[1].x, ',', Snakes[1].y, ' ', r1, ' ');
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
            for i := 1 to scrW div 2 do
              for j := scrH div 2 -2 to scrH div 2 + 2 do
                buffer[i,j] := -2;
          end;
        end;
      end;
    until snakes[1].dead;
  end;

var
  choice: integer;

begin
  measureScr();
  writeln('     Detected window size: ', scrW, 'x', scrH);
  writeln();
  if (scrW < 110) or (scrH < 50) then
  begin
    writeln('     Snake requires at least a 110x50 window.');
    writeln('     Please resize the window and restart Snake.');
    readln();
    exit;
  end;
  writeln('     To get the best experience,');
  writeln('     it is highly recommended that you apply the new ');
  writeln('     campbell color scheme to your command prompt window');
  writeln('     More info: ');
  writeln('     https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/');
  writeln();
  writeln('     Press enter to start the game');
  readln();
  randomize();
  choice := startScreen();
  if (choice = 1) then
    classicMode()
  else if (choice = 3) then
    battleMode();
  readln();
end.
