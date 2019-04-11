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