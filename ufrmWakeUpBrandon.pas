unit ufrmWakeUpBrandon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MPlayer, ComCtrls;

type
  TfrmWakeUpBrandon = class(TForm)
    tmrBlinker: TTimer;
    tmrSnooze: TTimer;
    btnSnooze: TButton;
    btnUp: TButton;
    MediaPlayer: TMediaPlayer;
    StatusBar: TStatusBar;
    lblWakeUp: TLabel;
    lblSnoozeTime: TLabel;
    tmrSecond: TTimer;
    procedure tmrSecondTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure tmrSnoozeTimer(Sender: TObject);
    procedure btnSnoozeClick(Sender: TObject);
    procedure tmrBlinkerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure WakeUp;
    procedure Snooze;
    procedure LoadRandomSong;
    procedure AssignSong(fn: string);
  end;

var
  frmWakeUpBrandon: TfrmWakeUpBrandon;


implementation

{$R *.dfm}

const
  // convenience constants
  TimerSecond = 1000;
  TimerMinute = 60 * TimerSecond;

procedure TfrmWakeUpBrandon.FormActivate(Sender: TObject);
begin
  // start with 5 minutes, 30 seconds
  tmrSnooze.Interval := TimerMinute * 5 + TimerSecond * 30;

  LoadRandomSong;
  WakeUp;
end;

procedure TfrmWakeUpBrandon.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TfrmWakeUpBrandon.tmrBlinkerTimer(Sender: TObject);
begin
  if Color = clYellow then
    Color := clBlack
  else
    Color := clYellow;

  lblWakeUp.Top := Random(ClientHeight - lblWakeUp.Height * 2) + lblWakeUp.Height div 2;
  lblWakeUp.Left := Random(ClientWidth - 400 - lblWakeUp.Width) + 400;
end;

procedure TfrmWakeUpBrandon.AssignSong(fn: string);
begin
  MediaPlayer.Close;
  StatusBar.SimpleText := 'Now playing: ' + fn;
  StatusBar.Update;
  MediaPlayer.FileName := '.\music\' + fn;
  MediaPlayer.Open;
end;

procedure TfrmWakeUpBrandon.btnSnoozeClick(Sender: TObject);
begin
  Snooze;
end;

procedure TfrmWakeUpBrandon.tmrSecondTimer(Sender: TObject);
begin
  lblSnoozeTime.Caption := IntToStr(tmrSnooze.Interval);
  lblSnoozeTime.Update;
end;

procedure TfrmWakeUpBrandon.tmrSnoozeTimer(Sender: TObject);
begin
  WakeUp;
end;

procedure TfrmWakeUpBrandon.btnUpClick(Sender: TObject);
begin
  tmrBlinker.Enabled := False;
  tmrSnooze.Enabled := False;
  MediaPlayer.Stop;
  Close;
end;

procedure TfrmWakeUpBrandon.LoadRandomSong;
var
  done: Boolean;
  s: TSearchRec;
  MP3List: TStringList;
  r: Integer;
begin
  MP3List := TStringList.create;
  try
    done := FindFirst('.\music\*.*', faReadOnly + faArchive, s) <> 0;
    while not done do begin
      MP3List.Add(s.Name);
      done := FindNext(s) <> 0;
    end;
    r := Random(MP3List.Count);
    AssignSong(MP3List.Strings[r]);
  finally
    FindClose(s);
    MP3List.Free;
  end;
end;

procedure TfrmWakeUpBrandon.WakeUp;
begin
  tmrSecond.Enabled := False;
  tmrSnooze.Enabled := False;
  MediaPlayer.Play;
  tmrBlinker.Enabled := True;
  lblSnoozeTime.Visible := False;
end;

procedure TfrmWakeUpBrandon.Snooze;
begin
  tmrBlinker.Enabled := False;
  MediaPlayer.Stop;
  Color := clAqua;

  // if snooze is still over a minute, shorten it by a minute
  if tmrSnooze.Interval > TimerMinute then
    tmrSnooze.Interval := tmrSnooze.Interval - TimerMinute;

  tmrSnooze.Enabled := True;
//  tmrSecond.Enabled := True;
//  lblSnoozeTime.Visible := True;
end;

end.
