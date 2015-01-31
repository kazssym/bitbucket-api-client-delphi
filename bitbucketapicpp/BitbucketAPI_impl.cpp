/*
 * BitbucketAPI - Bitbucket API unit (implementation)
 * Copyright (C) 2014 Kaz Nishimura
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <System.hpp>
#pragma hdrstop

#include "BitbucketAPI_impl.h"

#pragma package(smart_init)

using namespace Bitbucketapi_impl;

__fastcall TBitbucketClient::TBitbucketClient(TComponent *Owner)
        : inherited(Owner) {
}

__fastcall TBitbucketClient::~TBitbucketClient() {
}
