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

  {Measure screen width and height}
  procedure measureScr;
  begin
    scrW := WindMaxX+1;
    scrH := WindMaxY;
  end;