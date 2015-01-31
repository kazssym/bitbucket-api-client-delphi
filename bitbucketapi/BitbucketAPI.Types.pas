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

uses System.Classes, System.SysUtils;

type
  {
    Client credentials.
  }
  TClientCredentials = class(TPersistent)
  private
  var
    FID: string;
    FSecret : string;
  published
    property ID : string read FID write FID;
    property Secret : string read FSecret write FSecret;
  end;

  {
    Base exception for this package.
  }
  EBitbucketAPIException = class(Exception)
  end;

  {
    Bitbucket API client session.
  }
  IBitbucketSession = interface
    ['{48AE1846-0EA8-4DA3-9234-B3FA3190D280}']
  end;

  {
    Factory object for Bitbucket API client sessions.
  }
  IBitbucketSessionFactory = interface
    ['{AAB34981-CD69-45AC-8D19-32FE4217480D}']
    function GetSession(ClientCredentials: TClientCredentials)
        : IBitbucketSession; stdcall;
  end;

implementation

end.
