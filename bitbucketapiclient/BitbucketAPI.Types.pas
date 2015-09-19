{
  BitbucketAPI.Types - Bitbucket API common types
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

unit BitbucketAPI.Types;

interface

uses System.SysUtils, System.JSON;

type
  {
    Superclass of Bitbucket entities.
  }
  TBitbucketEntity = class abstract
  const
    TypeKey = 'type';
  private
  var
    FEntityType: String;
  protected
    constructor Create(const EntityType: String); overload;
    constructor Create(const JSONObject: TJSONObject); overload;
  public
    property EntityType: String read FEntityType;
  end;

  {
    Bitbucket user.
  }
  TBitbucketUser = class(TBitbucketEntity)
  const
    UserType = 'user';
  private
  var
    FUUID: TGUID;
    FName: String;
    FDisplayName: String;
    // TODO: Add more fields.
  public
    constructor Create; overload;
    constructor Create(const JSONObject: TJSONObject); overload;
    property UUID: TGUID read FUUID write FUUID;
    property Name: String read FName write FName;
    property DisplayName: String read FDisplayName write FDisplayName;
  end;

  TBitbucketRepository = class(TBitbucketEntity)
  const
    RepositoryType = 'repository';
  private
  var
    FOwner: TBitbucketUser;
  public
    constructor Create; overload;
    constructor Create(const JSONObject: TJSONObject); overload;
  end;

implementation

// TBitbucketEntity

constructor TBitbucketEntity.Create(const EntityType: string);
begin
  inherited Create;
  FEntityType := EntityType;
end;

constructor TBitbucketEntity.Create(const JSONObject: TJSONObject);
begin
  Create(TJSONString(JSONObject.GetValue(TypeKey)).Value);
end;

// TBitbucketUser

constructor TBitbucketUser.Create;
begin
  inherited Create(UserType);
end;

constructor TBitbucketUser.Create(const JSONObject: TJSONObject);
begin
  inherited;
  if EntityType <> UserType then
  begin
    raise EArgumentOutOfRangeException.Create(
        'The "type" value is not ' + UserType);
  end;
end;

// TBitbucketRepository

constructor TBitbucketRepository.Create;
begin
  inherited Create(RepositoryType);
end;

constructor TBitbucketRepository.Create(const JSONObject: TJSONObject);
begin
  inherited;
  if EntityType <> RepositoryType then
  begin
    raise EArgumentOutOfRangeException.Create(
        'The "type" value is not ' + RepositoryType);
  end;
end;

end.
