{
  BitbucketAPI.Design - Bitbucket API client design-time
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

unit BitbucketAPI.Design;

interface

procedure Register;

implementation

uses System.Classes, BitbucketAPI.Client, BitbucketAPI.Client.OAuth;

procedure Register;
begin
  RegisterComponents(
      'Bitbucket API Client', [TBitbucketClient, TOAuthBitbucketClient]);
end;

end.
