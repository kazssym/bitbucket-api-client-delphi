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

uses System.Classes, REST.Authenticator.OAuth, BitbucketAPI.Client;

type
  {
    Pair of an identifier and a secret for OAuth authorization.
  }
  TBitbucketOAuthCredentials = class(TPersistent)
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

  {
    Custom Bitbucket API client component with OAuth authorization.
  }
  TCustomBitbucketOAuthClient = class(TCustomBitbucketClient)
  const
    AuthorizationEndpointURI = 'https://bitbucket.org/site/oauth2/authorize';
    ToeknEndpointURI = 'https://bitbucket.org/site/oauth2/access_token';
  private
  var
    FClientCredentials: TBitbucketOAuthCredentials;
    Authenticator: TOAuth2Authenticator;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    function AuthorizationRequestURI(
        const RedirectionEndpointURI, State: String): String;
    function GetService(const Code: String): TBitbucketService;
    property ClientCredentials: TBitbucketOAuthCredentials
        read FClientCredentials;
  end;

  {
    Published Bitbucket API client component with OAuth authorization.
  }
  TBitbucketOAuthClient = class(TCustomBitbucketOAuthClient)
  published
    property User;
    property Password;
    property ClientCredentials;
  end;

implementation

// TBitbucketOAuthCredentials

constructor TBitbucketOAuthCredentials.Create;
begin
  inherited;
end;

constructor TBitbucketOAuthCredentials.Create(const Id, Secret: String);
begin
  inherited Create;
  FId := Id;
  FSecret := FSecret;
end;

procedure TBitbucketOAuthCredentials.Assign(Source: TPersistent);
begin
  if Source is TBitbucketOAuthCredentials then
  begin
    FId := TBitbucketOAuthCredentials(Source).FId;
    FSecret := TBitbucketOAuthCredentials(Source).FSecret;
  end
  else
    inherited;
end;

// TCustomBitbucketOAuthClient

constructor TCustomBitbucketOAuthClient.Create(Owner: TComponent);
begin
  inherited;
  FClientCredentials := TBitbucketOAuthCredentials.Create;
  Authenticator := TOAuth2Authenticator(Self);
end;

destructor TCustomBitbucketOAuthClient.Destroy;
begin
  FClientCredentials.Free;
end;

function TCustomBitbucketOAuthClient.AuthorizationRequestURI(
    const RedirectionEndpointURI, State: String): String;
begin
  Authenticator.ResetToDefaults;
  Authenticator.AuthorizationEndpoint := AuthorizationEndpointURI;
  Authenticator.ResponseType := TOAuth2ResponseType.rtCODE;
  Authenticator.ClientID := FClientCredentials.Id;
  Authenticator.ClientSecret := FClientCredentials.Secret;
  Authenticator.RedirectionEndpoint := RedirectionEndpointURI;
  // The value of State is not used.
  Result := Authenticator.AuthorizationRequestURI;
end;

function TCustomBitbucketOAuthClient.GetService(const Code: String)
    : TBitbucketService;
begin
  Authenticator.AuthCode := Code;
  Authenticator.ChangeAuthCodeToAccesToken;
  // TODO: Implement this function.
  Result := Nil;
end;

end.
