program Snake;

uses
  crt,
  Math,
  SysUtils,
  FastConsole;

{$I Helper.inc}
{$I MainMenu.inc}
{$I ClassicMode.inc}
{$I BattleMode.inc}

var
  choice: integer;

begin
  {Pre-launch prompt}
  measureScr();
  gotoxy(1,scrH);
  writeln;
  writeln;
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
  {Main program loop}
  repeat
    choice := startScreen();
    if (choice = 1) then
      classicMode()
    else if (choice = 3) then
      battleMode();
  until False;
  readln();
end.
