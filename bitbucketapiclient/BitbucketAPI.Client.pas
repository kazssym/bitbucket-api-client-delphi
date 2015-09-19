{
  BitbucketAPI.Client - Bitbucket API clients
  Copyright (C) 2014-2015 Nishimura Software Studio

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

unit BitbucketAPI.Client;

interface

uses System.Classes, BitbucketAPI.Types;

type
  {
    Abstract Bitbucket API service.
  }
  TBitbucketService = class abstract
  public
    function GetAuthenticated: Boolean; virtual;
    function GetCurrentUser: TBitbucketUser; virtual; abstract;
    property Authenticated: Boolean read GetAuthenticated;
    property CurrentUser: TBitbucketUser read GetCurrentUser;
  end;

  {
    Bitbucket API client component.
  }
  TCustomBitbucketClient = class(TComponent)
  private
  var
    FUser: String;
    FPassword: String;
  public
    constructor Create(Owner: TComponent); override;
    function GetService: TBitbucketService; overload; virtual;
    function GetService(const User, Password: String): TBitbucketService;
        overload; virtual;
    property User: String read FUser write FUser;
    property Password: String read FPassword write FPassword;
  end;

  {
    Bitbucket API client component.
  }
  TBitbucketClient = class(TCustomBitbucketClient)
  published
    property User;
    property Password;
  end;

implementation

// TBitbucketService

function TBitbucketService.GetAuthenticated: Boolean;
begin
  // TODO: Replace with a working code.
  Result := False;
end;

// TCustomBitbucketClient

function TCustomBitbucketClient.GetService: TBitbucketService;
begin
  Result := GetService(FUser, FPassword);
end;

function TCustomBitbucketClient.GetService(const User, Password: String)
    : TBitbucketService;
begin
  // TODO: Replace with a working code.
  Result := Nil;
end;

constructor TCustomBitbucketClient.Create(Owner: TComponent);
begin
  inherited;
end;

end.
