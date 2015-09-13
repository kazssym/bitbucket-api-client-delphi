{
  BitbucketAPI.Types - Bitbucket API common types
  Copyright (C) 2014-2015 Kaz Nishimura

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

unit BitbucketAPI.Types;

interface

uses System.Classes;

type
  {
    Pair of an identifier and its shared secret.
  }
  TCredentials = class(TPersistent)
  private
  var
    FID: string;
    FSecret: string;
    procedure SetID(const ID: string);
    procedure SetSecret(const Secret: string);
  public
    constructor Create; overload;
    constructor Create(const ID, Secret: string); overload;
    procedure Assign(Source: TPersistent); override;
  published
    property ID : string read FID write SetID;
    property Secret : string read FSecret write SetSecret;
  end;

implementation

constructor TCredentials.Create;
begin
  inherited;
end;

constructor TCredentials.Create(const ID: string; const Secret: string);
begin
  Create;
  FID := ID;
  FSecret := Secret;
end;

procedure TCredentials.Assign(Source: TPersistent);
begin
  if Source is TCredentials then
  begin
    ID := TCredentials(Source).ID;
    Secret := TCredentials(Source).Secret;
  end
  else
    inherited;
end;

procedure TCredentials.SetID(const ID: string);
begin
  FID := ID;
end;

procedure TCredentials.SetSecret(const Secret: string);
begin
  FSecret := Secret;
end;

end.
