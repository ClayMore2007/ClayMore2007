#include "Building.h"

Building::Building()
{
	m_SittingRoom = "keting";

	m_BedRoom = "woshi";
}

Building::~Building()
{

}

void Building::speak()
{
	cout << "chinese" << endl;
}