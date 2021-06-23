#pragma once
#include "Building.h"

class Building01 : public Building
{
public:

	Building01();
	~Building01();

	string m_SittingRoom;

	void speak();

};