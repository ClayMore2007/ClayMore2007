#pragma once
#include <iostream>
//#include <string>
using namespace std;

class Building
{

	//friend void GoodGay(Building* building);

public:
	Building();


	~Building();

	string m_SittingRoom;

	virtual void speak();

private:

	string m_BedRoom;
	
};
