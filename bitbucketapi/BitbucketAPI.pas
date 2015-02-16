{
  BitbucketAPI - Bitbucket API Client
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

unit BitbucketAPI;

interface

uses System.SysUtils, System.Classes, BitbucketAPI.Types;

type
  TBitbucketAPI = class(TComponent)
  private
  class var
    FSessionFactory: IBitbucketSessionFactory;
  var
    FClientCredentials: TCredentials;
  public
    class procedure SetSessionFactory(SessionFactory
        : IBitbucketSessionFactory); static;
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    function GetClientCredentials: TCredentials;
    function GetSession: IBitbucketSession;
  published
    property ClientCredentials: TCredentials
        read FClientCredentials;
  end;

  {
    Base exception in this package.
  }
  EBitbucketAPIException = class(Exception);

implementation

class procedure TBitbucketAPI.SetSessionFactory(SessionFactory
    : IBitbucketSessionFactory);
begin
  FSessionFactory := SessionFactory;
end;

constructor TBitbucketAPI.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FClientCredentials := TCredentials.Create;
end;

destructor TBitbucketAPI.Destroy;
begin
  FClientCredentials.Free;
  inherited Destroy;
end;

function TBitbucketAPI.GetClientCredentials;
begin
  Result := FClientCredentials;
end;

function TBitbucketAPI.GetSession;
begin
  if FSessionFactory <> nil then
  begin
    Result := FSessionFactory.GetSession(FClientCredentials);
  end;
end;

end.
