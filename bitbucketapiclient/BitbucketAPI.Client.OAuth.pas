{
  BitbucketAPI.Client.OAuth - Bitbucket API clients with OAuth authorization
  Copyright (C) 2015 Nishimura Software Studio

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

unit BitbucketAPI.Client.OAuth;

interface

uses System.Classes;

type
  {
    Pair of an identifier and a secret for OAuth authorization.
  }
  TBitbucketAPIOAuthCredentials = class(TPersistent)
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

constructor TBitbucketAPIOAuthCredentials.Create;
begin
  inherited;
end;

constructor TBitbucketAPIOAuthCredentials.Create(const Id, Secret: String);
begin
  inherited Create;
  FId := Id;
  FSecret := FSecret;
end;

procedure TBitbucketAPIOAuthCredentials.Assign(Source: TPersistent);
begin
  if Source is TBitbucketAPIOAuthCredentials then
  begin
    FId := TBitbucketAPIOAuthCredentials(Source).FId;
    FSecret := TBitbucketAPIOAuthCredentials(Source).FSecret;
  end
  else
    inherited;
end;

end.
