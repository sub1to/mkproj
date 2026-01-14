/*
	Copyright 2025-9999 sub1to

	This file is part of mkproj

	mkproj is free software; See LICENSE.MD or https://opensource.org/license/mit
*/

#ifndef MKPROJ_H
#define MKPROJ_H

#include <string>

namespace mkproj
{

bool    can_create_project(const std::string& workspaceName);
bool    create_project(const std::string& workspaceName, const std::string& projectName, const std::string& projectKind, const bool pedantic);

} // namespace mkproj

#endif
