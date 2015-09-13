{
  BitbucketAPI.OAuth - Bitbucket API Client OAuth Support
  Copyright (C) 2015 Kaz Nishimura

  This program is free software: you can redistribute it and/or modify it
  under the terms of the GNU General Public License as published by the Free
  Software Foundation, either version 3 of the License, or (at your option)
  any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  more details.

  You should have received a copy of the GNU General Public License along with
  this program.  If not, see <http://www.gnu.org/licenses/>.
}

unit BitbucketAPI.OAuth;

interface

uses System.Classes;

type
  {
    Pair of an identifier and a secret for OAuth authorization.
  }
  TOAuthCredentials = class(TPersistent)
  private
  var
    FId: String;
    FSecret: String;
  public
    constructor Create; overload;
    constructor Create(const Id, Secret: String); overload;
    procedure Assign(Source: TPersistent); override;
  published
    property Id: String read FId write FId;
    property Secret: String read FSecret write FSecret;
  end;

implementation

constructor TOAuthCredentials.Create;
begin
  inherited;
end;

constructor TOAuthCredentials.Create(const Id, Secret: String);
begin
  inherited Create;
  FId := Id;
  FSecret := FSecret;
end;

procedure TOAuthCredentials.Assign(Source: TPersistent);
begin
  if Source is TOAuthCredentials then
  begin
    FId := TOAuthCredentials(Source).FId;
    FSecret := TOAuthCredentials(Source).FSecret;
  end
  else
    inherited;
end;

end.
