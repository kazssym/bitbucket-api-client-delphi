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

uses
  System.Classes, System.SysUtils, REST.Authenticator.OAuth,
  BitbucketAPI.Client;

type
  {
    Custom Bitbucket API client component with OAuth authorization.
  }
  TCustomBitbucketOAuthClient = class(TCustomBitbucketClient)
  const
    AuthorizationEndpointURI = 'https://bitbucket.org/site/oauth2/authorize';
    TokenEndpointURI = 'https://bitbucket.org/site/oauth2/access_token';
  private
  var
    FClientID: string;
    FClientSecret: string;
    Authenticator: TOAuth2Authenticator;
  public
    constructor Create(Owner: TComponent); override;
    function HasClientCredentials: Boolean;
    function AuthorizationRequestURI(
        const RedirectionEndpointURI: string = '';
        const State: string = ''): string;
    function GetService(const Code: string): TBitbucketService;
    property ClientID: string read FClientID write FClientID;
    property ClientSecret: string read FClientSecret write FClientSecret;
  end;

  {
    Published Bitbucket API client component with OAuth authorization.
  }
  TBitbucketOAuthClient = class(TCustomBitbucketOAuthClient)
  published
    property User;
    property Password;
    property ClientID;
    property ClientSecret;
  end;

implementation

// TCustomBitbucketOAuthClient

constructor TCustomBitbucketOAuthClient.Create(Owner: TComponent);
begin
  inherited;
  Authenticator := TOAuth2Authenticator(Self);
end;

function TCustomBitbucketOAuthClient.HasClientCredentials: Boolean;
begin
  Result := not (FClientID.IsEmpty or FClientSecret.IsEmpty);
end;

function TCustomBitbucketOAuthClient.AuthorizationRequestURI(
    const RedirectionEndpointURI, State: string): string;
begin
  Result := nil;
  if HasClientCredentials then
  begin
    Authenticator.ResetToDefaults;
    Authenticator.AuthorizationEndpoint := AuthorizationEndpointURI;
    Authenticator.ResponseType := TOAuth2ResponseType.rtCODE;
    Authenticator.ClientID := FClientID;
    Authenticator.ClientSecret := FClientSecret;
    Authenticator.RedirectionEndpoint := RedirectionEndpointURI;
    // The value of State is not used.
    Result := Authenticator.AuthorizationRequestURI;
  end;
end;

function TCustomBitbucketOAuthClient.GetService(const Code: string)
    : TBitbucketService;
begin
  Authenticator.AccessTokenEndpoint := TokenEndpointURI;
  Authenticator.AuthCode := Code;
  Authenticator.ChangeAuthCodeToAccesToken;
  // TODO: Implement this function.
  Result := nil;
end;

end.
