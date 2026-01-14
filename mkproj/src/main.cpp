/*
	Copyright 2025-9999 sub1to

	This file is part of mkproj

	mkproj is free software; See LICENSE.MD or https://opensource.org/license/mit
*/

#include "pch.h"

#include "mkproj.h"

#include <cstring>

void print_help(const char* path)
{
    std::cout << "Usage: " << path << " [options] <workspace name> <kind>" << std::endl;
    std::cout << "Options:\n\t-n <name>   override project name\n\t-h          disable pedantic mode" << std::endl;
    std::cout << "Kinds:\n\tcon console\n\twin window windowed\n\tdll sharedlib\n\tlib staticlib" << std::endl;
}

int main(int argc, const char* argv[])
{
    bool        pedantic        = true;
    std::string workspaceName   = "";
    std::string projectName     = "";
    std::string projectKind     = "";

    if(argc < 3){
        // if argv[0] is not set, then jebiga
        print_help(argv[0]);
        return 1;
    }

    for(int i = 1; i < argc; ++i){
        if(strcmp(argv[i], "-n") == 0){
            if(++i >= argc){
                break;
            }
            projectName = argv[i];
            continue;
        }

        if(strcmp(argv[i], "-h") == 0){
            pedantic    = false;
            continue;
        }

        workspaceName   = argv[i++];

        if(projectName.empty()){
            projectName = workspaceName;
        }

        projectKind     = argv[i++];
        break;
    }

    if(workspaceName.empty() || projectName.empty() || projectKind.empty()){
        print_help(argv[0]);
        return 1;
    }

    if(projectKind == "con" || projectKind == "console"){
        projectKind     = "ConsoleApp";
    } else if(projectKind == "win" || projectKind == "window" || projectKind == "windowed"){
        projectKind     = "WindowedApp";
    } else if(projectKind == "dll" || projectKind == "sharedlib"){
        projectKind     = "SharedLib"; 
    } else if(projectKind == "lib" || projectKind == "staticlib"){
        projectKind     = "StaticLib";
    } else {
        std::cerr << "Unknown kind '" << projectKind << "'" << std::endl;
        print_help(argv[0]);
        return 1;
    }

    std::cout << "Workspace Name: " << workspaceName << std::endl;
    std::cout << "Project Name:   " << projectName << std::endl;
    std::cout << "Project Kind:   " << projectKind << std::endl;
    std::cout << "Pedantic:       " << pedantic << std::endl;

    if(!mkproj::can_create_project(workspaceName)){
        std::cerr << "Can't create project.. sorry, bye.." << std::endl;
        return 1;
    }

    if(!mkproj::create_project(workspaceName, projectName, projectKind, pedantic)){
        std::cerr << "Failed to create project.. sorry, bye.." << std::endl;
        return 1;
    }
}





